delimiter //
create procedure mycur (INOUT name_List varchar (100))
begin
	declare Done int default 0;
    declare S_name varchar (20) default " ";
    
    
    # Se define el cursor 
    declare std_cur cursor for select name from mytable;
     
     declare continue handler for not found set Done = 1;
     
     open  std_cur;
     
     #Se Declara un loop
     getdata:loop
		fetch std_cur into s_name;
        if Done = 1 then 
			leave getdata;
        end if;
        set name_List = concat (s_name, " ",name_List);
     end loop;
     
     close std_cur;
end//

set @name_List = " ";
call mycur (name_List);
select @name_List;
select * from mytable;