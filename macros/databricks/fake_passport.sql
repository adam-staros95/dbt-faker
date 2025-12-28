{% macro databricks__fake_passport(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            element_at(
                array(
                    'A',
                    'B',
                    'C',
                    'D',
                    'E',
                    'F',
                    'G',
                    'H',
                    'I',
                    'J',
                    'K',
                    'L',
                    'M',
                    'N',
                    'O',
                    'P',
                    'Q',
                    'R',
                    'S',
                    'T',
                    'U',
                    'V',
                    'W',
                    'X',
                    'Y',
                    'Z'
                ),
                1 + mod(abs(hash(cast({{ seed_column }} as string))), 26)
            ),
            element_at(
                array(
                    'A',
                    'B',
                    'C',
                    'D',
                    'E',
                    'F',
                    'G',
                    'H',
                    'I',
                    'J',
                    'K',
                    'L',
                    'M',
                    'N',
                    'O',
                    'P',
                    'Q',
                    'R',
                    'S',
                    'T',
                    'U',
                    'V',
                    'W',
                    'X',
                    'Y',
                    'Z'
                ),
                1 + mod(
                    abs(hash(cast(concat({{ seed_column }}, '_letter2') as string))), 26
                )
            ),
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_num') as string))),
                        10000000
                    ) as string
                ),
                7,
                '0'
            )
        )
    {% elif locale == 'en_US' %}
        concat(
            element_at(
                array('A', 'X', 'Y', 'Z'),
                1 + mod(abs(hash(cast({{ seed_column }} as string))), 4)
            ),
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_num') as string))),
                        100000000
                    ) as string
                ),
                8,
                '0'
            )
        )
    {% endif %}
{% endmacro %}
