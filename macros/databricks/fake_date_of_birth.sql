{% macro databricks__fake_date_of_birth(seed_column, locale='en_US', min_date=none, max_date=none, minimum_age=none, maximum_age=none, return_type='date') %}
    {% if minimum_age is not none and maximum_age is not none %}
        {% set age_expr = dbt_faker.databricks__fake_age(seed_column=seed_column, minimum_age=minimum_age, maximum_age=maximum_age, return_type='int') %}
        {% set dob_date = "date_sub(current_date(), " ~ age_expr ~ " * 365)" %}
    {% elif min_date is not none or max_date is not none %}
        {% if min_date is none %}
            {% set min_date_expr = "date_sub(current_date(), 120 * 365)" %}
        {% else %} {% set min_date_expr = "cast('" ~ min_date ~ "' as date)" %}
        {% endif %}

        {% if max_date is none %} {% set max_date_expr = "current_date()" %}
        {% else %} {% set max_date_expr = "cast('" ~ max_date ~ "' as date)" %}
        {% endif %}

        {% set max_age_calc = "cast(datediff(current_date(), " ~ min_date_expr ~ ") / 365.25 as int)" %}
        {% set min_age_calc = "cast(datediff(current_date(), " ~ max_date_expr ~ ") / 365.25 as int)" %}
        {% set age_range = "(" ~ max_age_calc ~ " - " ~ min_age_calc ~ " + 1)" %}

        {% set age_expr = "cast(" ~ min_age_calc ~ " + mod(abs(hash(cast(" ~ seed_column ~ " as string))), " ~ age_range ~ ") as int)" %}
        {% set dob_date = "date_sub(current_date(), " ~ age_expr ~ " * 365)" %}
    {% else %}
        {% set age_expr = dbt_faker.databricks__fake_age(seed_column=seed_column, return_type='int') %}
        {% set dob_date = "date_sub(current_date(), " ~ age_expr ~ " * 365)" %}
    {% endif %}

    {% if return_type == 'string' %}
        {% if locale == 'en_US' %}
            concat(
                lpad(cast(month({{ dob_date }}) as string), 2, '0'),
                '/',
                lpad(cast(day({{ dob_date }}) as string), 2, '0'),
                '/',
                cast(year({{ dob_date }}) as string)
            )
        {% elif locale == 'pl_PL' %}
            concat(
                lpad(cast(day({{ dob_date }}) as string), 2, '0'),
                '.',
                lpad(cast(month({{ dob_date }}) as string), 2, '0'),
                '.',
                cast(year({{ dob_date }}) as string)
            )
        {% endif %}
    {% else %} cast({{ dob_date }} as {{ return_type }})
    {% endif %}
{% endmacro %}
