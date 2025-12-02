{% macro validate_locale(locale) %}
    {% set supported_locales = dbt_faker.get_supported_locales() %}
    {% if not locale in supported_locales %}
        {% do exceptions.raise_compiler_error("Unsupported locale: '" ~ locale ~ "'. Supported locales are: " ~ (supported_locales | join(", "))) %}
    {% endif %}
{% endmacro %}

{% macro get_supported_locales() %}
    {% set supported_locales = ['en_US', 'pl_PL'] %} {{ return(supported_locales) }}
{% endmacro %}
