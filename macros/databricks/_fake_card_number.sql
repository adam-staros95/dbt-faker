{% macro databricks__fake_card_number(seed_column, formatted=true) %}
    {% if formatted %}
        concat(
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part1') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part2') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part3') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            ),
            '-',
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part4') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            )
        )
    {% else %}
        concat(
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part1') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            ),
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part2') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            ),
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part3') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            ),
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_part4') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            )
        )
    {% endif %}
{% endmacro %}
