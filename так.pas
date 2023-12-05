uses Crt;
type
  bam = function(x: Real): Real;

function f(x: real): real;
begin
  f:=2*(x**3)+(-2)*(x**2)+(-3)*x+14;
end;

procedure lev(a, b: Real; n: Integer; func: bam; var s, pogr:real);
var
  h, x: Real;
  i: Integer;
  fa, fb: real; //Знаечния первообразной
begin
  h:= (b-a)/n;
  x:= a;
  for i:=0 to n-1 do begin
    s:=s+f(x);
    x:=x+h;
  end;
  s:=s*h;
  fa:=1/2*a**4-2/3*a**3-3/2*a**2+14*a; //нахождение значения первой первообразной через производную
  fb:=1/2*b**4-2/3*b**3-3/2*b**2+14*b; //второй
  pogr:=(fb-fa) - s; //нахождение пгрешности 
end;

var
  a, b: Real;
  n: Integer;
  s, pogr: Real;
  ch: char;
  x, y: integer;
  color : Byte;
begin
  repeat
    ClrScr;
    textcolor(Yellow);
    writeln('1. Вычисление площади фигуры, ограниченной кривой');
    writeln('2. Выход');
    write('Выберите действие: '); 
    ch := ReadKey;
    case ch of
      '1':
      begin
        ClrScr;
        Textcolor(Yellow);
        writeln('Введите границы интегрирования: ');
        readln(a, b);
        Textcolor(Yellow);
        writeln('Введите количество делений: ');
        readln(n);
        lev(a, b, n, f, s, pogr);
        Textcolor(LightGreen);
        writeln('Площадь фигуры: ', s);
        Textcolor(LightGreen);
        writeln('Погрешность: ', pogr);
        readln;
      end;
      '2': halt;
    end;
  until ch = '2';
end.
