{% macro databricks__fake_home_number(seed_column, locale='en_US') %}
    concat(
        cast(
            1 + mod(
                abs(hash(cast(concat({{ seed_column }}, '_street_num') as string))), 200
            ) as string
        ),
        case
            when
                mod(abs(hash(cast(concat({{ seed_column }}, '_apt') as string))), 2) = 0
            then
                concat(
                    '/',
                    cast(
                        1 + mod(
                            abs(
                                hash(
                                    cast(
                                        concat({{ seed_column }}, '_apt_num') as string
                                    )
                                )
                            ),
                            100
                        ) as string
                    )
                )
            else ''
        end
    )
{% endmacro %}
