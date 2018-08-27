var
        f: text;
        x: array[1..100000] of boolean;
        a: array[1..100000] of longint;
        max, tansuatMax, temp: longint;

procedure Sang; //Tra ra false neu la nguyen to
var
        i, j: longint;
begin
        x[1]:=true;
        for i:=2 to trunc(sqrt(100000)) do if not x[i] then
        begin
                j:=i*i;
                while j <= 100000 do
                begin
                        x[j]:=true;     //Hop so
                        j:=j+i;
                end;
        end;
end;

begin
        Sang;

        tanSuatMax:=0;
        max:=0;

        assign(f, 'tansuat.inp');
        reset(f);
        while not eof(f) do
        begin
                read(f, temp);
                if not x[temp] then  //Neu temp la so nguyen to
                begin
                        inc(a[temp]);
                        if a[temp] > tanSuatMax then
                        begin
                                tanSuatMax:=a[temp];
                                max:=temp;
                        end
                        else if a[temp] = tanSuatMax then
                        begin
                                if temp > max then
                                begin
                                        tanSuatMax:=a[temp];
                                        max:=temp;
                                end;
                        end;
                end;
        end;
        close(f);

        assign(f, 'tansuat.out');
        rewrite(f);
        write(f, max, ' ', tanSuatmax);
        close(f);
end.