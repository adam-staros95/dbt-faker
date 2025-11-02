{% macro fake_first_name(seed_column, locale='en_US') %}
    {{ return(adapter.dispatch('fake_first_name', 'fake')(seed_column, locale)) }}
{% endmacro %}
