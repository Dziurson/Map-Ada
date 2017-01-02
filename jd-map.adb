with Ada.Text_IO; use Ada.Text_IO;
package body JD.map is

    function Double(I: in Integer) return Integer is
    begin
        return I*2;
    end Double;

    task body zad_map is
        func_t: Func_Proc;
        tab_t: TabPtr;
        s,l,b,e: Integer;
        task_1: access zad_map_in;
    begin
        loop
            select
                accept Process(tab: in out TabPtr; start: in Integer; last: in Integer; func: in Func_Proc) do
                    func_t := func;
                    tab_t := tab;
                    s := start;
                    l := last;                    
                end Process;
                if (s <= l) then
                    task_1 := new zad_map_in;
                    task_1.Process(tab_t,s+1,l,func_t);
                    tab_t(s) := func_t(tab_t(s));
                    task_1.EndThread;
                end if;
            or
                accept Show(L: in Integer; R: in Integer) do
                    b := L;
                    e := R;
                end Show;
                for k in b..e
                    loop
                        Put(Integer'Image(Integer(tab_t(k))));                         
                end loop;  
                put_line(" ");
            or
                accept EndThread;
                exit;                
            end select;
        end loop;
    end zad_map;
    
end JD.map;
