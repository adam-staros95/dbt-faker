{% macro databricks__fake_mobile_phone_number(seed_column, locale='en_US') %}
    {% if locale == 'en_US' %}
        concat(
            '(',
            lpad(
                cast(
                    200
                    + mod(abs(hash(cast({{ seed_column }} as string))), 800) as string
                ),
                3,
                '0'
            ),
            ') ',
            lpad(
                cast(
                    200 + mod(
                        abs(hash(cast(concat({{ seed_column }}, '_mid') as string))),
                        800
                    ) as string
                ),
                3,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_end') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            )
        )
    {% elif locale == 'pl_PL' %}
        concat(
            '+48 ',
            lpad(
                cast(
                    500
                    + mod(abs(hash(cast({{ seed_column }} as string))), 500) as string
                ),
                3,
                '0'
            ),
            ' ',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_mid') as string))),
                        1000
                    ) as string
                ),
                3,
                '0'
            ),
            ' ',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_end') as string))),
                        1000
                    ) as string
                ),
                3,
                '0'
            )
        )
    {% endif %}
{% endmacro %}
