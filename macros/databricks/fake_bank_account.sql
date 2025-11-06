{% macro databricks__fake_bank_account(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            'PL',
            lpad(
                cast(
                    mod(abs(hash(cast({{ seed_column }} as string))), 1000000000)
                as string),
                9,
                '0'
            ),
            lpad(
                cast(
                    mod(abs(hash(cast(concat({{ seed_column }}, '1') as string))), 1000000000)
                as string),
                9,
                '0'
            ),
            lpad(
                cast(
                    mod(abs(hash(cast(concat({{ seed_column }}, '2') as string))), 1000000)
                as string),
                6,
                '0'
            )
        )
    {% elif locale == 'en_US' %}
        lpad(
            cast(
                mod(abs(hash(cast({{ seed_column }} as string))), 9999999999)
            as string),
            10,
            '0'
        )
    {% endif %}
{% endmacro %}

