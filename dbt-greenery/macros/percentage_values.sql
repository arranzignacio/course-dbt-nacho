{% test percentage_values(model, column_name) %}


   select *
   from {{ model }}
   where {{ column_name }} > 100
   or {{ column_name }} < 0


{% endtest %}