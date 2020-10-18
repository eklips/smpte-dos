(* SMPTE color bars demo for DOS ; June 24 2020 *)
(* written by moxniso *)

program smpte;
uses crt, graph;

const
   black = 0; indigo = 1;
   gray = 8; cyan = 3;
   green = 2; red = 4;
   yellow = 14; lgray = 7;
   lcyan = 11; lgreen = 10;
   lmagenta = 13; lred = 12;
   blue = 9; white = 15;
   magenta = 5;

   max_width = 639; max_height = 479;
   top_bar_w = 91; top_bar_h = (max_height - 150);
   bottom_bar_w = 107; bottom_bar_h = (max_height - 120);

var
   gfx_d, gfx_m : integer;

procedure inittop;
begin
      { Repetitiveness since there's no preprocessor in turbo pascal :/ }
      setfillstyle(solidfill, lgray);
      bar(0, 0, top_bar_w, top_bar_h);

      setfillstyle(solidfill, yellow);
      bar(top_bar_w, 0, (top_bar_w*2), top_bar_h);

      setfillstyle(solidfill, lcyan);
      bar((top_bar_w*2), 0, (top_bar_w*3), top_bar_h);

      setfillstyle(solidfill, lgreen);
      bar((top_bar_w*3), 0, (top_bar_w*4), top_bar_h);

      setfillstyle(solidfill, lmagenta);
      bar((top_bar_w*4), 0, (top_bar_w*5), top_bar_h);

      setfillstyle(solidfill, lred);
      bar((top_bar_w*5), 0, (top_bar_w*6), top_bar_h);

      setfillstyle(solidfill, blue);
      bar((top_bar_w*6), 0, (top_bar_w*7), top_bar_h);
end;

procedure initbottom;
begin

      setfillstyle(solidfill, indigo);
      bar(0,bottom_bar_h, bottom_bar_w, max_height);

      setfillstyle(solidfill, white);
      bar(bottom_bar_w, bottom_bar_h, (bottom_bar_w*2), max_height);

      setfillstyle(solidfill, magenta);
      bar((bottom_bar_w*2), bottom_bar_h, (bottom_bar_w*3), max_height);

      setfillstyle(solidfill, black);
      bar((bottom_bar_w*3), bottom_bar_h, (bottom_bar_w*4), max_height);

      setfillstyle(solidfill, gray);
      bar((bottom_bar_w*4), bottom_bar_h, (bottom_bar_w*5), max_height);

      setfillstyle(solidfill, black);
      bar((bottom_bar_w*5), bottom_bar_h, (bottom_bar_w*6), max_height);
end;

procedure initmiddle;
begin

      setfillstyle(solidfill, blue);
      bar(0, top_bar_h, top_bar_w, bottom_bar_h);

      setfillstyle(solidfill, black);
      bar(top_bar_w, top_bar_h, (top_bar_w*2), bottom_bar_h);

      setfillstyle(solidfill, lmagenta);
      bar((top_bar_w*2), top_bar_h, (top_bar_w*3), bottom_bar_h);

      setfillstyle(solidfill, black);
      bar((top_bar_w*3), top_bar_h, (top_bar_w*4), bottom_bar_h);

      setfillstyle(solidfill, lcyan);
      bar((top_bar_w*4), top_bar_h, (top_bar_w*5), bottom_bar_h);

      setfillstyle(solidfill, black);
      bar((top_bar_w*5), top_bar_h, (top_bar_w*6), bottom_bar_h);

      setfillstyle(solidfill, white);
      bar((top_bar_w*6), top_bar_h, (top_bar_w*7), bottom_bar_h);
end;

begin
    gfx_d := VGA; gfx_m := VGAHi;
    initgraph(gfx_d, gfx_m, 'c:\tp\bgi');
    if graphresult<>grOK then
    begin
         writeln('Error initializing graph');
         write(grapherrormsg(graphresult));
         halt;
    end;
    inittop;
    initbottom;
    initmiddle;
    readkey;

    { had to hardcode since (max_width/2) results in type mismatch }
    setcolor(red);
    outtextxy(320, 230, 'EXITING...');
    delay(200);
    closegraph;
end.
