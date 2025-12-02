{% macro databricks__fake_ssn(seed_column, locale='en_US') %}
    {% if locale == 'pl_PL' %}
        concat(
            lpad(
                cast(mod(abs(hash(cast({{ seed_column }} as string))), 100) as string),
                2,
                '0'
            ),
            lpad(
                cast(
                    1 + mod(
                        abs(hash(cast(concat({{ seed_column }}, '_month') as string))),
                        12
                    ) as string
                ),
                2,
                '0'
            ),
            lpad(
                cast(
                    1 + mod(
                        abs(hash(cast(concat({{ seed_column }}, '_day') as string))), 28
                    ) as string
                ),
                2,
                '0'
            ),
            lpad(
                cast(
                    mod(
                        abs(hash(cast(concat({{ seed_column }}, '_seq') as string))),
                        10000
                    ) as string
                ),
                4,
                '0'
            ),
            cast(
                mod(
                    abs(hash(cast(concat({{ seed_column }}, '_check') as string))), 10
                ) as string
            )
        )
    {% elif locale == 'en_US' %}
        concat(
            case
                when mod(abs(hash(cast({{ seed_column }} as string))), 899) < 665
                then
                    lpad(
                        cast(
                            1 + mod(
                                abs(hash(cast({{ seed_column }} as string))), 665
                            ) as string
                        ),
                        3,
                        '0'
                    )
                else
                    lpad(
                        cast(
                            667 + mod(
                                abs(
                                    hash(
                                        cast(
                                            concat({{ seed_column }}, '_area') as string
                                        )
                                    )
                                ),
                                233
                            ) as string
                        ),
                        3,
                        '0'
                    )
            end,
            '-',
            lpad(
                cast(
                    1 + mod(
                        abs(hash(cast(concat({{ seed_column }}, '_group') as string))),
                        99
                    ) as string
                ),
                2,
                '0'
            ),
            '-',
            lpad(
                cast(
                    1 + mod(
                        abs(hash(cast(concat({{ seed_column }}, '_serial') as string))),
                        9999
                    ) as string
                ),
                4,
                '0'
            )
        )
    {% endif %}
{% endmacro %}
