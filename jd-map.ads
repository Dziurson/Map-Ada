package JD.map is

    type Tablica is array(Positive range <>) of Integer;
    type TabPtr is access Tablica;
    type Func_Proc is access function (I: in Integer) return Integer;
    function Double(I: in Integer) return Integer;
    task type zad_map is
        entry Process(tab: in out TabPtr; start: in Integer; last: in Integer; func: in Func_Proc);
        entry EndThread;
        entry Show(L: in Integer; R: in Integer);
    end zad_map;

    subtype zad_map_in is zad_map;
    
end JD.map;
