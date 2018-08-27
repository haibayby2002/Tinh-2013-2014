var
        f: text;
        thu, gioDau, gioKet, gioHat: integer;
        tien: longint;

begin
        assign(f, 'karaoke.inp');
        reset(f);
        readln(f, thu);
        read(f, gioDau, gioKet);
        close(f);

        gioHat:=gioKet - gioDau;
        if (thu >=2) and (thu <= 6) then        //Tu thu 2->6
        begin
                if (gioKet <= 14) and (gioDau < 14) then        //Gio bat dau va ket thuc truoc 14h
                begin
                        if gioHat > 3 then tien:=(3 * 40000) + (gioHat - 3) * 28000
                        else tien:=gioHat * 40000;
                end
                else if (gioKet > 14) and (gioDau >= 14) then   //Gio bat dau va ket thuc sau 14h
                begin
                        if gioHat > 3 then tien:=(3 * 50000) + (gioHat - 3) * 35000
                        else tien:=gioHat*50000;
                end
                else
                begin                                           //Gio bat dau truoc 14h va gio ket thuc sau 14h
                        if gioKet - gioDau <= 3 then
                        begin
                                tien:=(14 - gioDau) * 40000 + (gioKet - 14) * 50000;
                        end
                        else
                        begin
                                if 14 - gioDau > 3 then
                                begin
                                        tien:=3*40000 + (14 - gioDau - 3) * 28000 + (gioKet - 14) * 35000;
                                end
                                else
                                begin
                                        tien:=(14-gioDau) * 40000 + (gioDau + 3 - 14) * 50000 + (gioKet - gioDau - 3) * 35000;
                                end;
                        end;
                end;
        end
        else
        begin                                   //Thu bay chu nhat
                if gioHat > 3 then tien:=3 * 60000 + 42000 * (gioHat - 3)
                else tien:=gioHat * 60000;
        end;

        assign(f, 'karaoke.out');
        rewrite(f);
        write(f, tien);
        close(f);
end.