var n,m,i,j,c,t,w,xx,yy,x,y:longint;
    a:array[0..1005,0..1005] of char;
    dx:array[1..4] of longint=(-1,0,1,0);
    dy:array[1..4] of longint=(0,1,0,-1);
    h:array[1..1000000,1..2] of longint;
    l:array[1..1000,1..1000] of boolean;
    o:array[1..1000,1..1000] of longint;
    ans:array[1..100000] of longint;
begin
  readln(n,m);
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(a[i,j]);
      readln;
    end;
  for i:=1 to m do
    begin
      readln(x,y);
      if o[x,y]=0 then
        begin
          o[x,y]:=i;
          c:=1;
          t:=1;
          w:=1;
          h[t,1]:=x;
          h[t,2]:=y;
          l[x,y]:=true;
          while t<=w do
            begin
              for j:=1 to 4 do
                begin
                  xx:=h[t,1]+dx[j];
                  yy:=h[t,2]+dy[j];
                  if (xx>=1) and (xx<=n) and (yy>=1) and (yy<=n)
                  and (a[h[t,1],h[t,2]]<>a[xx,yy])
                  and not l[xx,yy] then
                    begin
                      inc(c);
                      inc(w);
                      l[xx,yy]:=true;
                      h[w,1]:=xx;
                      h[w,2]:=yy;
                      o[xx,yy]:=i;
                    end;
                end;
              inc(t);
            end;
          ans[i]:=c;

        end;
      writeln(ans[o[x,y]]);
    end;
end.


