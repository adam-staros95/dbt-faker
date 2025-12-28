{% macro fake_credit_card(seed_column, formatted=true) %}
    {{ return(adapter.dispatch('fake_credit_card', 'dbt_faker')(seed_column, formatted)) }}
{% endmacro %}
