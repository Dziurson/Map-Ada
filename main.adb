with JD.map; use JD.map;
with Ada.Text_IO; use Ada.Text_IO;

procedure main is
    task_1: access zad_map;     
    tab: Tablica(1..20);
    tab_p: TabPtr; 
    double_t: func_proc;
begin
    tab := (1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
    tab_p := new Tablica'(tab);
    double_t := Double'Access;
    task_1 := new zad_map;  
    task_1.Process(tab_p,1,20,double_t);    
    task_1.Show(1,20);
    task_1.EndThread;
end main;
