{% macro databricks__fake_gender(seed_column, locale='en_US', full_value=false) %}
    {% if locale == 'en_US' %}
        {% if full_value %}
            element_at(
                array('Male', 'Female'),
                1 + mod(abs(hash(cast({{ seed_column }} as string))), 2)
            )
        {% else %}
            element_at(
                array('M', 'F'),
                1 + mod(abs(hash(cast({{ seed_column }} as string))), 2)
            )
        {% endif %}
    {% elif locale == 'pl_PL' %}
        {% if full_value %}
            element_at(
                array('Kobieta', 'Mężczyzna'),
                1 + mod(abs(hash(cast({{ seed_column }} as string))), 2)
            )
        {% else %}
            element_at(
                array('K', 'M'),
                1 + mod(abs(hash(cast({{ seed_column }} as string))), 2)
            )
        {% endif %}
    {% endif %}
{% endmacro %}
