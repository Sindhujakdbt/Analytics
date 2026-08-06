{% macro first_macro(name) %}

select 'Hi, {{name}}' as Greetings

{% endmacro %}