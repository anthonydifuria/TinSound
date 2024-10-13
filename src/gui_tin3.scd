//GUI TIN SYNTH
(
//variabili gui
var w,ti,t1,t2,b1,s1,rs,s2D,c1,c2,c3,c4,button,we,s2;
//variabili funzioni fisico/chimiche
var f_temp_bol,f_temp_fus,f_vel_suono_fluid,f_vel_suono_solid,f_density_gas,f_density_solid;
//variabili funzioni di controllo
var n,t,b,c,sum2,sum_amp,sum_phase;
//variabili strumenti Synth


w = Window("TIN META-SYNTH", Rect(0,10,1450,1000)); w.front; w.background_(Color.grey);
c1 = CompositeView(w, Rect(10, 10, 1420, 40)).background_(Color.white);
ti = StaticText(c1, Rect(200,10,1000,25)).align_(\center);
ti.string="TIN META-SONIFICATION SYNTH    Anthony Di Furia";
ti.font = Font("Monaco", 20);
ti.stringColor_(Color.grey);

t1 = Array.fill(200);
b1 = Array.fill(100);
rs = Array.fill(100);
s1 = Array.fill(200);
we = Array.fill(120);

s2 = Array.fill(15);
n = Array.fill(20);
t = Array.fill(200);
b = Array.fill(100);
w.front;


//General properties
t1[0] = StaticText(w, Rect(650, 60, 250, 15)).background_(Color.grey).stringColor_(Color.black).string = "General properties";
t1[1] = StaticText(w, Rect(450, 80, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Name,symbol,number: Tin, Sn, 50";
t1[2] = StaticText(w, Rect(450, 100, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Element category: Poor Metal";
t1[3] = StaticText(w, Rect(450, 120, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Group, period, block: 14, 5, p ";
t1[4] = StaticText(w, Rect(740, 80, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Standard atomic weight: 118,710";
t1[5] = StaticText(w, Rect(740, 100, 250, 35)).background_(Color.white).stringColor_(Color.grey).string = "Electron configuration: 1s2 2s2 2p6 3s2 3p6 3d10 4s2 4p6 4d10 5s2 5p2";

//Physical properties
t1[6] = StaticText(w, Rect(650, 140, 250, 15)).background_(Color.grey).stringColor_(Color.black).string = "Physical properties";
t1[7] = StaticText(w, Rect(450, 160, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Density (near r.t.):(white) 7.365 g·cm−3";
t1[8] = StaticText(w, Rect(450, 180, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Density (near r.t.):(gray) 5.769 g·cm−3";
t1[9] = StaticText(w, Rect(450, 200, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Liquid density at m.p.:6.99 g·cm−3";
t1[10] = StaticText(w, Rect(450, 220, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Melting point:505.08 K, 231.93 °C, 449.47 °F";
t1[11] = StaticText(w, Rect(740, 160, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Boiling point:2875 K, 2602 °C, 4716 °F";
t1[12] = StaticText(w, Rect(740, 180, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Heat of fusion(white):7.03 kJ·mol−1";
t1[13] = StaticText(w, Rect(740, 200, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Heat of vaporization (white):296.1 kJ·mol−1";
t1[14] = StaticText(w, Rect(740, 220, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Molar heat capacity	 (white):27.112 J·mol−1·K−1";

//Atomic properties
t1[15] = StaticText(w, Rect(650, 240, 250, 15)).background_(Color.grey).stringColor_(Color.black).string = "Atomic properties";
t1[16] = StaticText(w, Rect(450, 260, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Oxidation states:4, 3, 2, 1, -4";
t1[17] = StaticText(w, Rect(450, 282.5, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Electronegativity:1.96 (Pauling scale)";
t1[18] = StaticText(w, Rect(450, 305, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Atomic radius:	140 pm";
t1[19] = StaticText(w, Rect(740, 260, 250, 60)).background_(Color.white).stringColor_(Color.grey).string = "Ionization energies:
1st: 708.6 kJ·mol−1
2nd: 1411.8 kJ·mol−1
3rd: 2943.0 kJ·mol−1";

//Miscellanea
t1[22] = StaticText(w, Rect(670, 320, 250, 15)).background_(Color.grey).stringColor_(Color.black).string = "Miscellanea";
t1[23] = StaticText(w, Rect(450, 340, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Crystal structure:(white) tetragonal";
t1[24] = StaticText(w, Rect(450, 360, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Crystal structure:(grey) diamond cubic";
t1[25] = StaticText(w, Rect(450, 380, 250, 35)).background_(Color.white).stringColor_(Color.grey).string = "Magnetic ordering:(gray) diamagnetic,
(white) paramagnetic";
t1[27] = StaticText(w, Rect(450, 420, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Electrical resistivity	(0 °C) 115 nΩ·m";
t1[28] = StaticText(w, Rect(450, 440, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Thermal conductivity:66.8 W·m−1·K−1";
t1[29] = StaticText(w, Rect(740, 340, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Thermal expansion(25 °C):22.0 µm·m−1·K−1";
t1[30] = StaticText(w, Rect(740, 360, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Speed of sound:2730 m·s−1";
t1[31] = StaticText(w, Rect(740, 380, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Young's modulus:50 GPa";
t1[32] = StaticText(w, Rect(740, 400, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Shear modulus	:18 GPa";
t1[33] = StaticText(w, Rect(740, 420, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Bulk modulus:58 GPa";
t1[34] = StaticText(w, Rect(740, 440, 250, 15)).background_(Color.white).stringColor_(Color.grey).string = "Poisson ratio:0.36";







//SONIFICATION PROPERTIES
c2 = CompositeView(w, Rect(10, 60, 430, 395)).background_(Color.white);
t1[38] = StaticText(c2, Rect(130, 2.5, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "SONIFICATION PROPERTIES";

b1[13] = Button(c2, Rect(5, 5,100, 20));
b1[13].states_([["CONTROL", Color.black, Color.grey]]).font =  Font("Monaco", 20);
t1[41]= StaticText(b1[13], Rect(4,55,60,10)).align_(\center).string="Control";t1[41].font = Font("Monaco", 8);
b1[13].mouseDownAction_({we[0] = Window("Control", Rect(10,10,1000,1000)).front.background_(Color.grey);

	s2D = Slider2D(we[0], Rect(80, 10, 830,830))
	.action_({|sl|

		b1[0].value = (sl.y*200+1);
		b1[1].value = (sl.x*5000);
		a.set(\temp1,sl.x*5000);a.set(\press,sl.y*200);
		g.set(\temp1,sl.x*5000);g.set(\press,sl.y*200);
		h.set(\temp1,sl.x*5000);h.set(\press,sl.y*200);
		//state
		if((sl.x*5000)>f_temp_bol.value(sl.y*200+1);,{t1[50].string = "State: Gas"},{if((sl.x*5000)>f_temp_fus.value(sl.y*200+1),{t1[50].string = "State: Liquid"},{t1[50].string = "State: Solid"});});
		//boling point
		b1[9].value = f_temp_bol.value(sl.y*200+1);
		//melting point
		b1[10].value = f_temp_fus.value(sl.y*200+1);
		//density
		if((sl.x*5000)>f_temp_bol.value(sl.y*200+1),
			{b1[8].value = f_density_gas.value(sl.x*5000,sl.y*200+1)},
			{
				if((sl.x*5000)>286.15,
					{b1[8].value = f_density_solid.value(sl.x*5000)},
					{b1[8].value = f_density_solid.value(sl.x*5000)-1596});
		});

		//density
		if((sl.x*5000)>f_temp_bol.value(sl.y*200+1),
			{a.set(\density,f_density_gas.value(sl.x*5000,sl.y*200+1)*10000);
				g.set(\density,f_density_gas.value(sl.x*5000,sl.y*200+1)*10000);
				h.set(\density,f_density_gas.value(sl.x*5000,sl.y*200+1)*10000);},
			{
				if((sl.x*5000)>286.15,
					{a.set(\density,f_density_solid.value(sl.x*5000));
						g.set(\density,f_density_solid.value(sl.x*5000));
						h.set(\density,f_density_solid.value(sl.x*5000));},
					{a.set(\density,f_density_solid.value(sl.x*5000)-1596);
						g.set(\density,f_density_solid.value(sl.x*5000)-1596);
						h.set(\density,f_density_solid.value(sl.x*5000)-1596);});
		});

		//speed of sound
		if((sl.x*5000)>f_temp_fus.value(sl.y*200+1),{b1[7].value = f_vel_suono_fluid.value(sl.x*5000)},{b1[7].value = f_vel_suono_solid.value(if((sl.x*5000)>286.15,{f_density_solid.value(sl.x*5000)},{f_density_solid.value(sl.x*5000)-1596}););
		});

		//speed of sound
		if((sl.x*5000)>f_temp_fus.value(sl.y*200+1),
			{a.set(\speed,f_vel_suono_fluid.value(sl.x*5000));
				g.set(\speed,f_vel_suono_fluid.value(sl.x*5000));
				h.set(\speed,f_vel_suono_fluid.value(sl.x*5000));},
			{a.set(\speed,f_vel_suono_solid.value(
				if((sl.x*5000)>286.15,
					{f_density_solid.value(sl.x*5000)},
					{f_density_solid.value(sl.x*5000)-1596});));
				g.set(\speed,f_vel_suono_solid.value(
					if((sl.x*5000)>286.15,
						{f_density_solid.value(sl.x*5000)},
						{f_density_solid.value(sl.x*5000)-1596});));
				h.set(\speed,f_vel_suono_solid.value(
					if((sl.x*5000)>286.15,
						{f_density_solid.value(sl.x*5000)},
						{f_density_solid.value(sl.x*5000)-1596});));
		});

	});

	t1[36] = StaticText(we[0], Rect(5, 20, 50, 15)).background_(Color.grey).stringColor_(Color.white).string = "PRESS";
	t1[37] = StaticText(we[0], Rect(940, 810, 50, 15)).background_(Color.grey).stringColor_(Color.white).string = "TEMP";

	b1[0] = NumberBox(we[0], Rect(5, 35, 50, 20));
	b1[0].action_({arg numb; numb.value.postln;
		s2D.y = numb.value/200;
		//boling point
		b1[9].value = f_temp_bol.value(numb.value);
		//melting point
		b1[10].value = f_temp_fus.value(numb.value);
	});


	b1[1] = NumberBox(we[0], Rect(930, 825, 60, 20));
	b1[1].action_({arg numb;
		s2D.x = numb.value/5000;

	});

});




//CONTROL RANDOM
button = Button(w, Rect(120, 182, 200, 20))
.states_([
	["RANDOM CONTROL - ON", Color.black, Color.grey],
	["RANDOM CONTROL - OFF", Color.black, Color.grey],
])
.action_({ arg me ;
	var val = me.value.postln ;

});
rs[0] = RangeSlider(c2, Rect(10, 145, 375, 20))
.lo_(0.2)
.range_(0.4)
.action_({ |slider|

	b1[2].value = (slider.lo*5000);
	b1[3].value = (slider.hi*5000);

});
rs[1] = RangeSlider(c2, Rect(10, 200, 375, 20))
.lo_(0.2)
.range_(0.4)
.action_({ |slider|

	b1[4].value = (slider.lo*200);
	b1[5].value = (slider.hi*200);

});


t1[40] = StaticText(c2, Rect(70, 172.5, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "MIN RANGE";
t1[41] = StaticText(c2, Rect(260, 172.5, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "MAX RANGE";
t1[42] = StaticText(c2, Rect(390, 147.5, 100, 15)).background_(Color.white).stringColor_(Color.grey).string = "TEMP";
b1[2] = NumberBox(c2, Rect(10, 170, 50, 20));
b1[2].action_({arg numb; numb.value.postln;
	rs[0].lo = numb.value/5000});
b1[3] = NumberBox(c2, Rect(200, 170, 50, 20));
b1[3].action_({arg numb; numb.value.postln;
	rs[0].hi = numb.value/5000});


t1[43] = StaticText(c2, Rect(70, 232.5, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "MIN RANGE";
t1[44] = StaticText(c2, Rect(260, 232.5, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "MAX RANGE";
t1[45] = StaticText(c2, Rect(390, 202.5, 100, 15)).background_(Color.white).stringColor_(Color.grey).string = "PRESS";
b1[4] = NumberBox(c2, Rect(10, 230, 50, 20));
b1[4].action_({arg numb; numb.value.postln;
	rs[1].lo = numb.value/200});
b1[5] = NumberBox(c2, Rect(200, 230, 50, 20));
b1[5].action_({arg numb; numb.value.postln;
	rs[1].hi = numb.value/200});




//dust - impulse
t1[46] = StaticText(c2, Rect(10, 280, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "DUST";
t1[47] = StaticText(c2, Rect(355, 280, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "IMPULSE";

s1[0] = Slider(c2, Rect(10, 260, 400, 20)).value_(1);
s1[0].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1).postln;

});

//vel trig
t1[48] = StaticText(c2, Rect(405, 302.5, 100, 15)).background_(Color.white).stringColor_(Color.grey).string = "trig";
b1[6] = NumberBox(c2, Rect(360, 300, 45, 20)).value_(1);

s1[1] = Slider(c2, Rect(10, 300, 350, 20)).value_(1/20);
s1[1].action_({ arg me;
	var v = me.value.linlin(0, 1, 0.1, 20).postln;

	b1[6].value = v.value;
});

//STATO DELLA MATERIA
t1[50] = StaticText(c2, Rect(130, 30, 400, 20)).background_(Color.white).stringColor_(Color.grey).string = "State:";
t1[50].font = Font("Monaco", 20);

//VELOOCITA' DEL SUONO
t1[51] = StaticText(c2, Rect(25, 60, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "Speed of Sound:";
b1[7] = NumberBox(c2, Rect(130, 57.5, 70, 20));

//DENSITA'
t1[52] = StaticText(c2, Rect(220, 60, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "Density(w,g):";
b1[8] = NumberBox(c2, Rect(330, 57.5, 70, 20));

//PUNTO DI EBOLLIZIONE E DI FUSIONE
t1[53] = StaticText(c2, Rect(25, 90, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "Boiling Point(P):";
b1[9] = NumberBox(c2, Rect(130, 87.5, 70, 20));
t1[54] = StaticText(c2, Rect(220, 90, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "Melting Point(P):";
b1[10] = NumberBox(c2, Rect(330, 87.5, 70, 20));

//SONIFICATION VECTORIAL
c3 = CompositeView(w, Rect(1000, 60, 430, 395)).background_(Color.white);
t1[56] = StaticText(c3, Rect(130, 2.5, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "SONIFICATION VECTORIAL";

//MODULAZIONI
t1[106] = StaticText(c3, Rect(5, 30, 20, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "AM";
t1[107] = StaticText(c3, Rect(5, 50, 20, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "FM";
t1[108] = StaticText(c3, Rect(5, 70, 20, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "PM";

s1[60] = Slider(c3, Rect(30, 30, 390, 15));
	s1[60].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
	i.set(\fmod,v);
	l.set(\fmod,v);
	m.set(\fmod,v);
	q.set(\fmod,v);
	});

s1[61] = Slider(c3, Rect(30, 50, 390, 15));
	s1[61].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
	i.set(\pmod,v);
	l.set(\pmod,v);
	m.set(\pmod,v);
	q.set(\pmod,v);
	});
s1[62] = Slider(c3, Rect(30, 70, 390, 15));
	s1[62].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
	i.set(\amod,v);
	l.set(\amod,v);
	m.set(\amod,v);
	q.set(\amod,v);
	});

//CONTROLLO RANDOM
t1[108] = StaticText(c3, Rect(400, 320, 20, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "ON";
s1[63] = Slider(c3, Rect(5, 320, 390, 15));
	s1[63].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
	i.set(\on_off,v);
	l.set(\on_off,v);
	m.set(\on_off,v);
	q.set(\on_off,v);
	});


t1[108] = StaticText(c3, Rect(5, 122.5, 40, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "Amp";
rs[2] = RangeSlider(c3, Rect(50, 120, 370, 20));
rs[2].action_({ |slider|



	i.set(\minamp,slider.lo);
	i.set(\maxamp,slider.hi);
	l.set(\minamp,slider.lo);
	l.set(\maxamp,slider.hi);
	m.set(\minamp,slider.lo);
	m.set(\maxamp,slider.hi);
	q.set(\minamp,slider.lo);
	q.set(\maxamp,slider.hi);
});

t1[109] = StaticText(c3, Rect(5, 142.5, 40, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "Freq";
rs[3] = RangeSlider(c3, Rect(50, 140, 370, 20));
rs[3].action_({ |slider|

	b1[56].value = (slider.lo*5000);
	b1[57].value = (slider.hi*5000);

	i.set(\min,slider.lo*5000);
	i.set(\max,slider.hi*5000);
	l.set(\min,slider.lo*5000);
	l.set(\max,slider.hi*5000);
	m.set(\min,slider.lo*5000);
	m.set(\max,slider.hi*5000);
	q.set(\min,slider.lo*5000);
	q.set(\max,slider.hi*5000);
});

t1[111] = StaticText(c3, Rect(150, 162.5, 40, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "min";
t1[112] = StaticText(c3, Rect(350, 162.5, 40, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "max";
b1[56] = NumberBox(c3, Rect(70, 162.5, 70, 15));
b1[56].action = {arg numb; numb.value;



};
b1[57] = NumberBox(c3, Rect(270, 162.5, 70, 15));
b1[56].action = {arg numb; numb.value;



};

t1[110] = StaticText(c3, Rect(5, 182.5, 40, 15)).background_(Color.black(0.7,1)).align_(\center).stringColor_(Color.white).string = "Phase";
rs[4] = RangeSlider(c3, Rect(50, 180, 370, 20));
rs[4].action_({ |slider|

	i.set(\minphase,slider.lo);
	i.set(\maxphase,slider.hi);
	l.set(\minphase,slider.lo);
	l.set(\maxphase,slider.hi);
	m.set(\minphase,slider.lo);
	m.set(\maxphase,slider.hi);
	q.set(\minphase,slider.lo);
	q.set(\maxphase,slider.hi);
});

//TRIGGER
t1[113] = StaticText(c3, Rect(370, 212.5, 100, 15)).background_(Color.white).stringColor_(Color.black).string = "Trig Amp";
b1[58] = NumberBox(c3, Rect(320, 210, 45, 20));
s1[64] = Slider(c3, Rect(5, 210, 310, 20));
	s1[64].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 100);
	i.set(\trigamp,v);
	l.set(\trigamp,v);
	m.set(\trigamp,v);
	q.set(\trigamp,v);
	});

t1[114] = StaticText(c3, Rect(370, 232.5, 100, 15)).background_(Color.white).stringColor_(Color.black).string = "Trig Freq";
b1[6] = NumberBox(c3, Rect(320, 230, 45, 20));
s1[65] = Slider(c3, Rect(5, 230, 310, 20));
	s1[65].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 10);
	i.set(\trig,v);
	l.set(\trig,v);
	m.set(\trig,v);
	q.set(\trig,v);
	});

t1[115] = StaticText(c3, Rect(370, 252.5, 100, 15)).background_(Color.white).stringColor_(Color.black).string = "Trig Phas";
b1[6] = NumberBox(c3, Rect(320, 250, 45, 20));
s1[66] = Slider(c3, Rect(5, 250, 310, 20));
	s1[66].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 100);
	i.set(\trigphase,v);
	l.set(\trigphase,v);
	m.set(\trigphase,v);
	q.set(\trigphase,v);
	});

//DUST-IMPULSE
t1[116] = StaticText(c3, Rect(10, 300, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "DUST";
t1[117] = StaticText(c3, Rect(355, 300, 400, 15)).background_(Color.white).stringColor_(Color.grey).string = "IMPULSE";

s1[38] = Slider(c3, Rect(10, 280, 400, 20)).value_(1);





//CONTROLLO MANUALE
c = Array.fill(20);

b1[51] = Button(c3, Rect(5, 5, 100, 20));
b1[51].states_([["CONTROL", Color.black, Color.grey]]).font =  Font("Monaco", 20);
t1[55]= StaticText(b1[51], Rect(4,55,60,10)).align_(\center).string="Control";t1[55].font = Font("Monaco", 8);
b1[51].mouseDownAction_({we[1] = Window("TinVectorSinth", Rect(0, 100, 1415, 550)).front.background_(Color.black);



	c[2] = CompositeView(we[1], Rect(5, 5, 610, 45)).background_(Color.grey);

	c[0] = CompositeView(we[1], Rect(5, 55, 610, 250)).background_(Color.grey);
t[36] = StaticText(c[0], Rect(150, 5, 300, 20)).string_("FONDAMENTAL PARTIALS").align_(\center);

	//Sinusoidi fondamentali
	//frequenze
	s2[0] = Slider(c[0], Rect(10, 40, 20, 200));
	s2[1] = Slider(c[0], Rect(30, 40, 20, 200));
	s2[2] = Slider(c[0], Rect(50, 40, 20, 200));
	s2[3] = Slider(c[0], Rect(70, 40, 20, 200));
	s2[4] = Slider(c[0], Rect(90, 40, 20, 200));


	s2[0].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 140);
		i.set(\f1,v);
		l.set(\f1,v);
		m.set(\f1,v);
		q.set(\f1,v);

	});

	s2[1].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 140);
		i.set(\f2,v);
		l.set(\f2,v);
		m.set(\f2,v);
		q.set(\f2,v);
		});
	s2[2].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 140);
		i.set(\f3,v);
		l.set(\f3,v);
		m.set(\f3,v);
		q.set(\f3,v);
	});
	s2[3].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 140);

		i.set(\f4,v);
		l.set(\f4,v);
		m.set(\f4,v);
		q.set(\f4,v);});
	s2[4].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 140);

		i.set(\f5,v);
		l.set(\f5,v);
		m.set(\f5,v);
		q.set(\f5,v);
		});


	n[0] = NumberBox(c[0], Rect(120, 60, 80, 20));
	n[0].action_({sum2.value;});
	n[1] = NumberBox(c[0], Rect(120, 100, 80, 20));
	n[1].action_({sum2.value});
	n[2] = NumberBox(c[0], Rect(120, 140, 80, 20));
	n[2].action_({sum2.value});
	n[3] = NumberBox(c[0], Rect(120, 180, 80, 20));
	n[3].action_({sum2.value});
	n[4] = NumberBox(c[0], Rect(120, 220, 80, 20));
	n[4].action_({sum2.value});

	t[0] = StaticText(c[0], Rect(120, 40, 80, 20)).string_("FREQ 1").align_(\center);
	t[1] = StaticText(c[0], Rect(120, 80, 80, 20)).string_("FREQ 2").align_(\center);
	t[2] = StaticText(c[0], Rect(120, 120, 80, 20)).string_("FREQ 3").align_(\center);
	t[3] = StaticText(c[0], Rect(120, 160, 80, 20)).string_("FREQ 4").align_(\center);
	t[4] = StaticText(c[0], Rect(120, 200, 80, 20)).string_("FREQ 5").align_(\center);

	//ampiezze
	s2[5] = Slider(c[0], Rect(210, 40, 20, 200));
	s2[6] = Slider(c[0], Rect(230, 40, 20, 200));
	s2[7] = Slider(c[0], Rect(250, 40, 20, 200));
	s2[8] = Slider(c[0], Rect(270, 40, 20, 200));
	s2[9] = Slider(c[0], Rect(290, 40, 20, 200));


	s2[5].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\a1,v);
		l.set(\a1,v);
		m.set(\a1,v);
		q.set(\a1,v);
		});
	s2[6].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\a2,v);
		l.set(\a2,v);
		m.set(\a2,v);
		q.set(\a2,v);});
	s2[7].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\a3,v);
		l.set(\a3,v);
		m.set(\a3,v);
		q.set(\a3,v);});
	s2[8].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\a4,v);
		l.set(\a4,v);
		m.set(\a4,v);
		q.set(\a4,v);});
	s2[9].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\a5,v);
		l.set(\a5,v);
		m.set(\a5,v);
		q.set(\a5,v);});

	n[5] = NumberBox(c[0], Rect(320, 60, 80, 20));
	n[5].action_({sum_amp.value});
	n[6] = NumberBox(c[0], Rect(320, 100, 80, 20));
	n[6].action_({sum_amp.value});
	n[7] = NumberBox(c[0], Rect(320, 140, 80, 20));
	n[7].action_({sum_amp.value});
	n[8] = NumberBox(c[0], Rect(320, 180, 80, 20));
	n[8].action_({sum_amp.value});
	n[9] = NumberBox(c[0], Rect(320, 220, 80, 20));
	n[9].action_({sum_amp.value});

	t[5] = StaticText(c[0], Rect(320, 40, 80, 20)).string_("AMP 1").align_(\center);
	t[6] = StaticText(c[0], Rect(320, 80, 80, 20)).string_("AMP 2").align_(\center);
	t[7] = StaticText(c[0], Rect(320, 120, 80, 20)).string_("AMP 3").align_(\center);
	t[8] = StaticText(c[0], Rect(320, 160, 80, 20)).string_("AMP 4").align_(\center);
	t[9] = StaticText(c[0], Rect(320, 200, 80, 20)).string_("AMP 5").align_(\center);

	//fasi
	s2[10] = Slider(c[0], Rect(410, 40, 20, 200));
	s2[11] = Slider(c[0], Rect(430, 40, 20, 200));
	s2[12] = Slider(c[0], Rect(450, 40, 20, 200));
	s2[13] = Slider(c[0], Rect(470, 40, 20, 200));
	s2[14] = Slider(c[0], Rect(490, 40, 20, 200));


	s2[10].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\p1,v);
		l.set(\1,v);
		m.set(\p1,v);
		q.set(\p1,v);});
	s2[11].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\p2,v);
		l.set(\p2,v);
		m.set(\p2,v);
		q.set(\p2,v);});
	s2[12].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\p3,v);
		l.set(\p3,v);
		m.set(\p3,v);
		q.set(\p3,v);});
	s2[13].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\p4,v);
		l.set(\p4,v);
		m.set(\p4,v);
		q.set(\p4,v);});
	s2[14].action_({arg me;
		var v = me.value.linlin(0, 1, 0, 1);
		i.set(\p5,v);
		l.set(\p5,v);
		m.set(\p5,v);
		q.set(\p5,v);});

	n[10] = NumberBox(c[0], Rect(520, 60, 80, 20));
	n[10].action_({sum_phase.value});
	n[11] = NumberBox(c[0], Rect(520, 100, 80, 20));
	n[11].action_({sum_phase.value});
	n[12] = NumberBox(c[0], Rect(520, 140, 80, 20));
	n[12].action_({sum_phase.value});
	n[13] = NumberBox(c[0], Rect(520, 180, 80, 20));
	n[13].action_({sum_phase.value});
	n[14] = NumberBox(c[0], Rect(520, 220, 80, 20));
	n[14].action_({sum_phase.value});

	t[10] = StaticText(c[0], Rect(520, 40, 80, 20)).string_("PHASE 1").align_(\center);
	t[11] = StaticText(c[0], Rect(520, 80, 80, 20)).string_("PHASE 2").align_(\center);
	t[12] = StaticText(c[0], Rect(520, 120, 80, 20)).string_("PHASE 3").align_(\center);
	t[13] = StaticText(c[0], Rect(520, 160, 80, 20)).string_("PHASE 4").align_(\center);
	t[14] = StaticText(c[0], Rect(520, 200, 80, 20)).string_("PHASE 5").align_(\center);

	//funzione somma
	sum2 = {var s0,s1,s2,s3,s4;
		s0 = n[0].value;
		s1 = n[1].value;
		s2 = n[2].value;
		s3 = n[3].value;
		s4 = n[4].value;
		//frequenze prima serie
		t[16].string ="FREQ1:" ++(s0+s1);
		t[19].string ="FREQ2:" ++(s1+s2);
		t[22].string ="FREQ3:" ++(s2+s3);
		t[25].string ="FREQ4:" ++(s3+s4);
		//freq seconda serie
		t[29].string ="FREQ1:" ++(s0+(s1*2)+s2);
		t[32].string ="FREQ2:" ++(s1+(s2*2)+s3);
		t[35].string ="FREQ3:" ++(s2+(s3*2)+s4);
		//freq terza serie
		t[39].string ="FREQ1:" ++(s0+(s1*3)+(s2*3)+s3);
		t[42].string ="FREQ2:" ++(s1+(s2*3)+(s3*3)+s4);
		//freq quarta serie
		t[46].string ="FREQ1:" ++(s0+(s1*4)+(s2*6)+(s3*4)+s4);




		//frequenze sinistre fondamentali
		t[96].string ="FREQ1:" ++(s0);
		t[99].string ="FREQ2:" ++(s0+s1);
		t[102].string ="FREQ3:" ++(s0+(s1*2)+s2);
		t[105].string ="FREQ4:" ++(s0+(s1*3)+(s2*3)+s3);
		t[108].string ="FREQ5:" ++(s0+(s1*4)+(s2*6)+(s3*4)+s4);

		//freq sinistre prima serie
		t[111].string ="FREQ1:" ++((s0*2)+s1);
		t[114].string ="FREQ2:" ++((s0*2)+(s1*3)+s2);
		t[117].string ="FREQ3:" ++((s0*2)+(s1*5)+(s2*4)+s3);
		t[120].string ="FREQ4:" ++((s0*2)+(s1*7)+(s2*9)+(s3*5)+s4);
		//freq sinistre seconda serie
		t[123].string ="FREQ1:" ++((s0*4)+(s1*4)+s2);
		t[126].string ="FREQ2:" ++((s0*4)+(s1*8)+(s2*5)+s3);
		t[129].string ="FREQ3:" ++((s0*4)+(s1*12)+(s2*13)+(s3*6)+s4);
		//freq sinistre terza serie
		t[132].string ="FREQ1:" ++((s0*8)+(s1*12)+(s2*6)+s3);
		t[135].string ="FREQ2:" ++((s0*8)+(s1*20)+(s2*18)+(s3*7)+s4);
		//freq sinistre quarta serie
		t[138].string ="FREQ1:" ++((s0*16)+(s1*32)+(s2*24)+(s3*8)+s4);


		//frequenze destre fondamentali
		t[50].string ="FREQ1:" ++(s4);
		t[53].string ="FREQ2:" ++(s3+s4);
		t[56].string ="FREQ3:" ++(s2+(s3*2)+s4);
		t[59].string ="FREQ4:" ++(s1+(s2*3)+(s3*3)+s4);
		t[62].string ="FREQ5:" ++(s0+(s1*4)+(s2*6)+(s3*4)+s4);
		//freq destre prima serie
		t[65].string ="FREQ1:" ++(s3+(s4*2));
		t[68].string ="FREQ2:" ++(s2+(s3*3)+(s4*2));
		t[71].string ="FREQ3:" ++(s1+(s2*4)+(s3*5)+(s4*2));
		t[74].string ="FREQ4:" ++(s0+(s1*5)+(s2*9)+(s3*7)+(s4*2));

		//freq destre seconda serie
		t[77].string ="FREQ1:" ++(s2+(s3*4)+(s4*4));
		t[80].string ="FREQ2:" ++(s1+(s2*5)+(s3*8)+(s4*4));
		t[83].string ="FREQ3:" ++(s0+(s1*6)+(s2*13)+(s3*12)+(s4*4));

		//freq destre terza serie
		t[86].string ="FREQ1:" ++(s1+(s2*6)+(s3*12)+(s4*8));
		t[89].string ="FREQ2:" ++(s0+(s1*7)+(s2*18)+(s3*20)+(s4*8));

		//freq destre quarta serie
		t[92].string ="FREQ1:" ++(s0+(s1*8)+(s2*24)+(s3*32)+(s4*16));






		//DERIVAZIONE FINALE
		t[142].string ="FREQ1:"++((s0*31)+(s1*75)+(s2*70)+(s3*30)+(s4*5));
		t[145].string ="FREQ2:"++((s0*16)+(s1*48)+(s2*55)+(s3*29)+(s4*6));
		t[148].string ="FREQ3:"++((s0*7)+(s1*12)+(s2*50)+(s3*34)+(s4*9));
		t[151].string ="FREQ4:"++((s0*6)+(s1*29)+(s2*55)+(s3*48)+(s4*16));
		t[154].string ="FREQ5:"++((s0*5)+(s1*30)+(s2*70)+(s3*75)+(s4*31));
		//prima serie
		t[157].string ="FREQ1:"++((s0*47)+(s1*123)+(s2*125)+(s3*59)+(s4*11));
		t[160].string ="FREQ2:"++((s0*23)+(s1*60)+(s2*105)+(s3*63)+(s4*15));
		t[163].string ="FREQ3:"++((s0*13)+(s1*41)+(s2*105)+(s3*82)+(s4*25));
		t[166].string ="FREQ4:"++((s0*11)+(s1*59)+(s2*125)+(s3*123)+(s4*47));
		//seconda serie
		t[169].string ="FREQ1:"++((s0*70)+(s1*183)+(s2*230)+(s3*122)+(s4*26));
		t[172].string ="FREQ2:"++((s0*36)+(s1*101)+(s2*210)+(s3*145)+(s4*40));
		t[175].string ="FREQ3:"++((s0*24)+(s1*100)+(s2*230)+(s3*205)+(s4*72));
		//terza serie
		t[178].string ="FREQ1:"++((s0*106)+(s1*284)+(s2*440)+(s3*267)+(s4*66));
		t[181].string ="FREQ2:"++((s0*60)+(s1*201)+(s2*440)+(s3*350)+(s4*112));
		//quarta serie
		t[184].string ="FREQ1:"++((s0*166)+(s1*485)+(s2*880)+(s3*617)+(s4*178));


	};


	sum_amp = {var s0,s1,s2,s3,s4;
		s0 = n[5].value;
		s1 = n[6].value;
		s2 = n[7].value;
		s3 = n[8].value;
		s4 = n[9].value;
		// prima serie
		t[17].string ="AMP1:" ++((s0+s1)/2);
		t[20].string ="AMP2:" ++((s1+s2)/2);
		t[23].string ="AMP3:" ++((s2+s3)/2);
		t[26].string ="AMP4:" ++((s3+s4)/2);
		// seconda serie
		t[30].string ="AMP1:" ++((s0+(s1*2)+s2)/4);
		t[33].string ="AMP2:" ++((s1+(s2*2)+s3)/4);
		t[36].string ="AMP3:" ++((s2+(s3*2)+s4)/4);
		// terza serie
		t[40].string ="AMP1:" ++((s0+(s1*3)+(s2*3)+s3)/8);
		t[43].string ="AMP2:" ++((s1+(s2*3)+(s3*3)+s4)/8);
		// quarta serie
		t[47].string ="AMP1:" ++((s0+(s1*4)+(s2*6)+(s3*4)+s4)/16);


		//frequenze sinistre fondamentali
		t[97].string ="AMP1:" ++((s0)/1);
		t[100].string ="AMP2:" ++((s0+s1)/2);
		t[103].string ="AMP3:" ++((s0+(s1*2)+s2)/4);
		t[106].string ="AMP4:" ++((s0+(s1*3)+(s2*3)+s3)/8);
		t[109].string ="AMP5:" ++((s0+(s1*4)+(s2*6)+(s3*4)+s4)/16);

		//freq sinistre prima serie
		t[112].string ="AMP1:" ++(((s0*2)+s1)/3);
		t[115].string ="AMP2:" ++(((s0*2)+(s1*3)+s2)/6);
		t[118].string ="AMP3:" ++(((s0*2)+(s1*5)+(s2*4)+s3)/12);
		t[121].string ="AMP4:" ++(((s0*2)+(s1*7)+(s2*9)+(s3*5)+s4)/24);
		//freq sinistre seconda serie
		t[124].string ="AMP1:" ++(((s0*4)+(s1*4)+s2)/9);
		t[127].string ="AMP2:" ++(((s0*4)+(s1*8)+(s2*5)+s3)/18);
		t[130].string ="AMP3:" ++(((s0*4)+(s1*12)+(s2*13)+(s3*6)+s4)/36);
		//freq sinistre terza serie
		t[133].string ="AMP1:" ++(((s0*8)+(s1*12)+(s2*6)+s3)/27);
		t[136].string ="AMP2:" ++(((s0*8)+(s1*20)+(s2*18)+(s3*7)+s4)/54);
		//freq sinistre quarta serie
		t[139].string ="AMP1:" ++(((s0*16)+(s1*32)+(s2*24)+(s3*8)+s4)/81);


		//frequenze destre fondamentali
		t[51].string ="AMP1:" ++((s4)/1);
		t[54].string ="AMP2:" ++((s3+s4)/2);
		t[57].string ="AMP3:" ++((s2+(s3*2)+s4)/4);
		t[60].string ="AMP4:" ++((s1+(s2*3)+(s3*3)+s4)/8);
		t[63].string ="AMP5:" ++((s0+(s1*4)+(s2*6)+(s3*4)+s4)/16);
		//freq destre prima serie
		t[66].string ="AMP1:" ++((s3+(s4*2))/3);
		t[69].string ="AMP2:" ++((s2+(s3*3)+(s4*2))/6);
		t[72].string ="AMP3:" ++((s1+(s2*4)+(s3*5)+(s4*2))/12);
		t[75].string ="AMP4:" ++((s0+(s1*5)+(s2*9)+(s3*7)+(s4*2))/24);

		//freq destre seconda serie
		t[78].string ="AMP1:" ++((s2+(s3*4)+(s4*4))/9);
		t[81].string ="AMP2:" ++((s1+(s2*5)+(s3*8)+(s4*4))/18);
		t[84].string ="AMP3:" ++((s0+(s1*6)+(s2*13)+(s3*12)+(s4*4))/36);

		//freq destre terza serie
		t[87].string ="AMP1:" ++((s1+(s2*6)+(s3*12)+(s4*8))/27);
		t[90].string ="AMP2:" ++((s0+(s1*7)+(s2*18)+(s3*20)+(s4*8))/54);

		//freq destre quarta serie
		t[93].string ="AMP1:" ++((s0+(s1*8)+(s2*24)+(s3*32)+(s4*16))/81);



		//DERIVAZIONE FINALE
		t[143].string ="AMP1:"++(((s0*31)+(s1*75)+(s2*70)+(s3*30)+(s4*5))/211);
		t[146].string ="AMP2:"++(((s0*16)+(s1*48)+(s2*55)+(s3*29)+(s4*6))/154);
		t[149].string ="AMP3:"++(((s0*7)+(s1*12)+(s2*50)+(s3*34)+(s4*9))/112);
		t[152].string ="AMP4:"++(((s0*6)+(s1*29)+(s2*55)+(s3*48)+(s4*16))/154);
		t[155].string ="AMP5:"++(((s0*5)+(s1*30)+(s2*70)+(s3*75)+(s4*31))/211);



	};



	sum_phase = {var s0,s1,s2,s3,s4;
		s0 = n[10].value;
		s1 = n[11].value;
		s2 = n[12].value;
		s3 = n[13].value;
		s4 = n
		[14].value;
		//frequenze prima serie
		t[18].string ="PHASE1:" ++((s0+s1)/2);
		t[21].string ="PHASE2:" ++((s1+s2)/2);
		t[24].string ="PHASE3:" ++((s2+s3)/2);
		t[27].string ="PHASE4:" ++((s3+s4)/2);
		//freq seconda serie
		t[31].string ="PHASE1:" ++((s0+(s1*2)+s2)/4);
		t[34].string ="PHASE2:" ++((s1+(s2*2)+s3)/4);
		t[37].string ="PHASE3:" ++((s2+(s3*2)+s4)/4);
		//freq terza serie
		t[41].string ="PHASE1:" ++((s0+(s1*3)+(s2*3)+s3)/8);
		t[44].string ="PHASE2:" ++((s1+(s2*3)+(s3*3)+s4)/8);
		//freq quarta serie
		t[48].string ="PHASE1:" ++((s0+(s1*4)+(s2*6)+(s3*4)+s4)/16);


		//frequenze sinistre fondamentali
		t[98].string ="PHASE1:" ++((s0)/1);
		t[101].string ="PHASE2:" ++((s0+s1)/2);
		t[104].string ="PHASE3:" ++((s0+(s1*2)+s2)/4);
		t[107].string ="PHASE4:" ++((s0+(s1*3)+(s2*3)+s3)/8);
		t[110].string ="PHASE5:" ++((s0+(s1*4)+(s2*6)+(s3*4)+s4)/16);

		//freq sinistre prima serie
		t[113].string ="PHASE1:" ++(((s0*2)+s1)/3);
		t[116].string ="PHASE2:" ++(((s0*2)+(s1*3)+s2)/6);
		t[119].string ="PHASE3:" ++(((s0*2)+(s1*5)+(s2*4)+s3)/12);
		t[122].string ="PHASE4:" ++(((s0*2)+(s1*7)+(s2*9)+(s3*5)+s4)/24);
		//freq sinistre seconda serie
		t[125].string ="PHASE1:" ++(((s0*4)+(s1*4)+s2)/9);
		t[128].string ="PHASE2:" ++(((s0*4)+(s1*8)+(s2*5)+s3)/18);
		t[131].string ="PHASE3:" ++(((s0*4)+(s1*12)+(s2*13)+(s3*6)+s4)/36);
		//freq sinistre terza serie
		t[134].string ="PHASE1:" ++(((s0*8)+(s1*12)+(s2*6)+s3)/27);
		t[137].string ="PHASE2:" ++(((s0*8)+(s1*20)+(s2*18)+(s3*7)+s4)/54);
		//freq sinistre quarta serie
		t[140].string ="PHASE1:" ++(((s0*16)+(s1*32)+(s2*24)+(s3*8)+s4)/81);


		//frequenze destre fondamentali
		t[52].string ="PHASE1:" ++((s4)/1);
		t[55].string ="PHASE2:" ++((s3+s4)/2);
		t[58].string ="PHASE3:" ++((s2+(s3*2)+s4)/4);
		t[61].string ="PHASE4:" ++((s1+(s2*3)+(s3*3)+s4)/8);
		t[64].string ="PHASE5:" ++((s0+(s1*4)+(s2*6)+(s3*4)+s4)/16);
		//freq destre prima serie
		t[67].string ="PHASE1:" ++((s3+(s4*2))/3);
		t[70].string ="PHASE2:" ++((s2+(s3*3)+(s4*2))/6);
		t[73].string ="PHASE3:" ++((s1+(s2*4)+(s3*5)+(s4*2))/12);
		t[76].string ="PHASE4:" ++((s0+(s1*5)+(s2*9)+(s3*7)+(s4*2))/24);

		//freq destre seconda serie
		t[79].string ="PHASE1:" ++((s2+(s3*4)+(s4*4))/9);
		t[82].string ="PHASE2:" ++((s1+(s2*5)+(s3*8)+(s4*4))/18);
		t[85].string ="PHASE3:" ++((s0+(s1*6)+(s2*13)+(s3*12)+(s4*4))/36);

		//freq destre terza serie
		t[88].string ="PHASE1:" ++((s1+(s2*6)+(s3*12)+(s4*8))/27);
		t[91].string ="PHASE2:" ++((s0+(s1*7)+(s2*18)+(s3*20)+(s4*8))/54);

		//freq destre quarta serie
		t[94].string ="PHASE1:" ++((s0+(s1*8)+(s2*24)+(s3*32)+(s4*16))/81);


		//DERIVAZIONE FINALE
		t[144].string ="PHASE1:"++(((s0*31)+(s1*75)+(s2*70)+(s3*30)+(s4*5))/211);
		t[147].string ="PHASE2:"++(((s0*16)+(s1*48)+(s2*55)+(s3*29)+(s4*6))/154);
		t[150].string ="PHASE3:"++(((s0*7)+(s1*12)+(s2*50)+(s3*34)+(s4*9))/112);
		t[153].string ="PHASE4:"++(((s0*6)+(s1*29)+(s2*55)+(s3*48)+(s4*16))/154);
		t[156].string ="PHASE5:"++(((s0*5)+(s1*30)+(s2*70)+(s3*75)+(s4*31))/211);

	};




	//derivazione dalla fondamentale
	c[1] = CompositeView(we[1], Rect(620, 5, 610, 300)).background_(Color.grey);
	//prima serie derivata
	t[15] = StaticText(c[1], Rect(5, 5, 145, 20)).string_("I - PARTIAL");
	//sin 1
	t[16] = StaticText(c[1], Rect(5, 30, 145, 20)).string_("FREQ 1:").background_(Color.grey(0.7));
	t[17] = StaticText(c[1], Rect(5, 50, 145, 20)).string_("AMP 1:").background_(Color.grey(0.7));
	t[18] = StaticText(c[1], Rect(5, 70, 145, 20)).string_("PHASE 1:").background_(Color.grey(0.7));
	//sin 2
	t[19] = StaticText(c[1], Rect(5, 95, 145, 20)).string_("FREQ 2:").background_(Color.grey(0.7));
	t[20] = StaticText(c[1], Rect(5, 115, 145, 20)).string_("AMP 2:").background_(Color.grey(0.7));
	t[21] = StaticText(c[1], Rect(5, 135, 145, 20)).string_("PHASE 2:").background_(Color.grey(0.7));
	//sin 3
	t[22] = StaticText(c[1], Rect(5, 160, 145, 20)).string_("FREQ 3:").background_(Color.grey(0.7));
	t[23] = StaticText(c[1], Rect(5, 180, 145, 20)).string_("AMP 3:").background_(Color.grey(0.7));
	t[24] = StaticText(c[1], Rect(5, 200, 145, 20)).string_("PHASE 3:").background_(Color.grey(0.7));
	//sin 4
	t[25] = StaticText(c[1], Rect(5, 225, 145, 20)).string_("FREQ 4:").background_(Color.grey(0.7));
	t[26] = StaticText(c[1], Rect(5, 245, 145, 20)).string_("AMP 4:").background_(Color.grey(0.7));
	t[27] = StaticText(c[1], Rect(5, 265 , 145, 20)).string_("PHASE 4:").background_(Color.grey(0.7));

	//seconda serie derivata
	t[28] = StaticText(c[1], Rect(150, 5, 200, 20)).string_("II - PARTIAL");
	//sin 1
	t[29] = StaticText(c[1], Rect(155, 62.5, 145, 20)).string_("FREQ 1:").background_(Color.grey(0.7));
	t[30] = StaticText(c[1], Rect(155, 82.5, 145, 20)).string_("AMP 1:").background_(Color.grey(0.7));
	t[31] = StaticText(c[1], Rect(155, 102.5, 145, 20)).string_("PHASE 1:").background_(Color.grey(0.7));
	//sin 2
	t[32] = StaticText(c[1], Rect(155, 127.5, 145, 20)).string_("FREQ 2:").background_(Color.grey(0.7));
	t[33] = StaticText(c[1], Rect(155, 147.5, 145, 20)).string_("AMP 2:").background_(Color.grey(0.7));
	t[34] = StaticText(c[1], Rect(155, 167.5, 145, 20)).string_("PHASE 2:").background_(Color.grey(0.7));
	//sin 3
	t[35] = StaticText(c[1], Rect(155, 192.5, 145, 20)).string_("FREQ 3:").background_(Color.grey(0.7));
	t[36] = StaticText(c[1], Rect(155, 212.5, 145, 20)).string_("AMP 3:").background_(Color.grey(0.7));
	t[37] = StaticText(c[1], Rect(155, 232.5, 145, 20)).string_("PHASE 3:").background_(Color.grey(0.7));

	//terza serie derivata
	t[38] = StaticText(c[1], Rect(300, 5, 200, 20)).string_("III - PARTIAL");
	//sin 1
	t[39] = StaticText(c[1], Rect(305, 95, 145, 20)).string_("FREQ 1:").background_(Color.grey(0.7));
	t[40] = StaticText(c[1], Rect(305, 115, 145, 20)).string_("AMP 1:").background_(Color.grey(0.7));
	t[41] = StaticText(c[1], Rect(305, 135, 145, 20)).string_("PHASE 1:").background_(Color.grey(0.7));
	//sin 2
	t[42] = StaticText(c[1], Rect(305, 160, 145, 20)).string_("FREQ 2:").background_(Color.grey(0.7));
	t[43] = StaticText(c[1], Rect(305, 180, 145, 20)).string_("AMP 2:").background_(Color.grey(0.7));
	t[44] = StaticText(c[1], Rect(305, 200, 145, 20)).string_("PHASE 2:").background_(Color.grey(0.7));

	//quarta serie derivata
	t[45] = StaticText(c[1], Rect(450, 5, 200, 20)).string_("IV - PARTIAL");
	//sin 1
	t[46] = StaticText(c[1], Rect(455, 127.5, 145, 20)).string_("FREQ 1:").background_(Color.grey(0.7));
	t[47] = StaticText(c[1], Rect(455, 147.5, 145, 20)).string_("AMP 1:").background_(Color.grey(0.7));
	t[48] = StaticText(c[1], Rect(455, 167.5, 145, 20)).string_("PHASE 1:").background_(Color.grey(0.7));





	//fondamentali destra
	c[4] = CompositeView(we[1], Rect(5, 310, 610, 230)).background_(Color.grey);
	t[49] = StaticText(c[4], Rect(30, 5, 200, 20)).string_("PARTIAL RIGHT").align_(\center);
	//sin 1
	t[50] = StaticText(c[4], Rect(2, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[51] = StaticText(c[4], Rect(2, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[52] = StaticText(c[4], Rect(2, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[53] = StaticText(c[4], Rect(2, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[54] = StaticText(c[4], Rect(2, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[55] = StaticText(c[4], Rect(2, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 3
	t[56] = StaticText(c[4], Rect(2, 106, 115, 12)).string_("FREQ 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[57] = StaticText(c[4], Rect(2, 118, 115, 12)).string_("AMP 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[58] = StaticText(c[4], Rect(2, 130, 115, 12)).string_("PHASE 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 4
	t[59] = StaticText(c[4], Rect(2, 144, 115, 12)).string_("FREQ 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[60] = StaticText(c[4], Rect(2, 156, 115, 12)).string_("AMP 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[61] = StaticText(c[4], Rect(2, 168, 115, 12)).string_("PHASE 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 5
	t[62] = StaticText(c[4], Rect(2, 182, 115, 12)).string_("FREQ 5:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[63] = StaticText(c[4], Rect(2, 194, 115, 12)).string_("AMP 5:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[64] = StaticText(c[4], Rect(2, 206, 115, 12)).string_("PHASE 5:").background_(Color.grey(0.7)).font_(Font(size:10));


	//prima serie derivate destre
	//sin 1
	t[65] = StaticText(c[4], Rect(124, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[66] = StaticText(c[4], Rect(124, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[67] = StaticText(c[4], Rect(124, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[68] = StaticText(c[4], Rect(124, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[69] = StaticText(c[4], Rect(124, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[70] = StaticText(c[4], Rect(124, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 3
	t[71] = StaticText(c[4], Rect(124, 106, 115, 12)).string_("FREQ 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[72] = StaticText(c[4], Rect(124, 118, 115, 12)).string_("AMP 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[73] = StaticText(c[4], Rect(124, 130, 115, 12)).string_("PHASE 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 4
	t[74] = StaticText(c[4], Rect(124, 144, 115, 12)).string_("FREQ 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[75] = StaticText(c[4], Rect(124, 156, 115, 12)).string_("AMP 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[76] = StaticText(c[4], Rect(124, 168, 115, 12)).string_("PHASE 4:").background_(Color.grey(0.7)).font_(Font(size:10));


	//seconda serie derivate destre
	//sin 1
	t[77] = StaticText(c[4], Rect(246, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[78] = StaticText(c[4], Rect(246, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[79] = StaticText(c[4], Rect(246, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[80] = StaticText(c[4], Rect(246, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[81] = StaticText(c[4], Rect(246, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[82] = StaticText(c[4], Rect(246, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 3
	t[83] = StaticText(c[4], Rect(246, 106, 115, 12)).string_("FREQ 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[84] = StaticText(c[4], Rect(246, 118, 115, 12)).string_("AMP 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[85] = StaticText(c[4], Rect(246, 130, 115, 12)).string_("PHASE 3:").background_(Color.grey(0.7)).font_(Font(size:10));


	//terza serie derivate destre
	//sin 1
	t[86] = StaticText(c[4], Rect(368, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[87] = StaticText(c[4], Rect(368, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[88] = StaticText(c[4], Rect(368, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[89] = StaticText(c[4], Rect(368, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[90] = StaticText(c[4], Rect(368, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[91] = StaticText(c[4], Rect(368, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));

	//quinta serie derivate destre
	//sin 1
	t[92] = StaticText(c[4], Rect(490, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[93] = StaticText(c[4], Rect(490, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[94] = StaticText(c[4], Rect(490, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2




	//fondamentali sinistra
	c[5] = CompositeView(we[1], Rect(620, 310, 610, 230)).background_(Color.grey);
	t[95] = StaticText(c[5], Rect(30, 5, 200, 20)).string_("PARTIAL LEFT").align_(\center);
	//sin 1
	t[96] = StaticText(c[5], Rect(2, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[97] = StaticText(c[5], Rect(2, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[98] = StaticText(c[5], Rect(2, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[99] = StaticText(c[5], Rect(2, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[100] = StaticText(c[5], Rect(2, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[101] = StaticText(c[5], Rect(2, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 3
	t[102] = StaticText(c[5], Rect(2, 106, 115, 12)).string_("FREQ 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[103] = StaticText(c[5], Rect(2, 118, 115, 12)).string_("AMP 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[104] = StaticText(c[5], Rect(2, 130, 115, 12)).string_("PHASE 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 4
	t[105] = StaticText(c[5], Rect(2, 144, 115, 12)).string_("FREQ 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[106] = StaticText(c[5], Rect(2, 156, 115, 12)).string_("AMP 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[107] = StaticText(c[5], Rect(2, 168, 115, 12)).string_("PHASE 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 5
	t[108] = StaticText(c[5], Rect(2, 182, 115, 12)).string_("FREQ 5:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[109] = StaticText(c[5], Rect(2, 194, 115, 12)).string_("AMP 5:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[110] = StaticText(c[5], Rect(2, 206, 115, 12)).string_("PHASE 5:").background_(Color.grey(0.7)).font_(Font(size:10));


	//prima serie derivate sinistre
	//sin 1
	t[111] = StaticText(c[5], Rect(124, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[112] = StaticText(c[5], Rect(124, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[113] = StaticText(c[5], Rect(124, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[114] = StaticText(c[5], Rect(124, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[115] = StaticText(c[5], Rect(124, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[116] = StaticText(c[5], Rect(124, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 3
	t[117] = StaticText(c[5], Rect(124, 106, 115, 12)).string_("FREQ 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[118] = StaticText(c[5], Rect(124, 118, 115, 12)).string_("AMP 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[119] = StaticText(c[5], Rect(124, 130, 115, 12)).string_("PHASE 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 4
	t[120] = StaticText(c[5], Rect(124, 144, 115, 12)).string_("FREQ 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[121] = StaticText(c[5], Rect(124, 156, 115, 12)).string_("AMP 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[122] = StaticText(c[5], Rect(124, 168, 115, 12)).string_("PHASE 4:").background_(Color.grey(0.7)).font_(Font(size:10));


	//seconda serie derivate sinistre
	//sin 1
	t[123] = StaticText(c[5], Rect(246, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[124] = StaticText(c[5], Rect(246, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[125] = StaticText(c[5], Rect(246, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[126] = StaticText(c[5], Rect(246, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[127] = StaticText(c[5], Rect(246, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[128] = StaticText(c[5], Rect(246, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 3
	t[129] = StaticText(c[5], Rect(246, 106, 115, 12)).string_("FREQ 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[130] = StaticText(c[5], Rect(246, 118, 115, 12)).string_("AMP 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[131] = StaticText(c[5], Rect(246, 130, 115, 12)).string_("PHASE 3:").background_(Color.grey(0.7)).font_(Font(size:10));


	//terza serie derivate sinistre
	//sin 1
	t[132] = StaticText(c[5], Rect(368, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[133] = StaticText(c[5], Rect(368, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[134] = StaticText(c[5], Rect(368, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[135] = StaticText(c[5], Rect(368, 68, 115, 12)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[136] = StaticText(c[5], Rect(368, 80, 115, 12)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[137] = StaticText(c[5], Rect(368, 92, 115, 12)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));

	//quinta serie derivate sinistre
	//sin 1
	t[138] = StaticText(c[5], Rect(490, 30, 115, 12)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[139] = StaticText(c[5], Rect(490, 42, 115, 12)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[140] = StaticText(c[5], Rect(490, 54, 115, 12)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2


	//DERIVAZIONE FINALE
	c[6] = CompositeView(we[1], Rect(1235, 5, 175, 535)).background_(Color.grey);

	t[141] = StaticText(c[6], Rect(5, 5, 200, 40)).string_("PARTIALS
	FINAL").align_(\center);
	//sin 1
	t[142] = StaticText(c[6], Rect(2, 60, 170, 20)).string_("FREQ 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[143] = StaticText(c[6], Rect(2, 80, 170, 20)).string_("AMP 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[144] = StaticText(c[6], Rect(2, 100, 170, 20)).string_("PHASE 1:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 2
	t[145] = StaticText(c[6], Rect(2, 150, 170, 20)).string_("FREQ 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[146] = StaticText(c[6], Rect(2, 170, 170, 20)).string_("AMP 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[147] = StaticText(c[6], Rect(2, 190, 170, 20)).string_("PHASE 2:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 3
	t[148] = StaticText(c[6], Rect(2, 240, 170, 20)).string_("FREQ 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[149] = StaticText(c[6], Rect(2, 260, 170, 20)).string_("AMP 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[150] = StaticText(c[6], Rect(2, 280, 170, 20)).string_("PHASE 3:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 4
	t[151] = StaticText(c[6], Rect(2, 330, 170, 20)).string_("FREQ 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[152] = StaticText(c[6], Rect(2, 350, 170, 20)).string_("AMP 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[153] = StaticText(c[6], Rect(2,  370, 170, 20)).string_("PHASE 4:").background_(Color.grey(0.7)).font_(Font(size:10));
	//sin 5
	t[154] = StaticText(c[6], Rect(2, 420, 170, 20)).string_("FREQ 5:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[155] = StaticText(c[6], Rect(2, 440, 170, 20)).string_("AMP 5:").background_(Color.grey(0.7)).font_(Font(size:10));
	t[156] = StaticText(c[6], Rect(2, 460, 170, 20)).string_("PHASE 5:").background_(Color.grey(0.7)).font_(Font(size:10));

	we[1].front;
});


//ORBITALS - AMBISONICS
c4 = CompositeView(w, Rect(10, 465, 1420, 375)).background_(Color.grey(0.7,1));
t1[35] = StaticText(c4, Rect(650, 5, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "ORBITALS - AMBISONICS";


//ANTI_HEISENBERG ORBITALI S
t1[60] = StaticText(c4, Rect(10, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "1s";
t1[61] = StaticText(c4, Rect(25, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "2s";
t1[62] = StaticText(c4, Rect(40, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3s";
t1[63] = StaticText(c4, Rect(55, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4s";
t1[64] = StaticText(c4, Rect(70, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "5s";
t1[65] = StaticText(c4, Rect(95, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.black).string = "S";

s1[6] = Slider(c4, Rect(10, 35, 15, 325)).background_(Color.white);
s1[6].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\sl1, v);
});
s1[7] = Slider(c4, Rect(25, 35, 15, 325)).background_(Color.white);
s1[7].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\sl2, v);
});
s1[8] = Slider(c4, Rect(40, 35, 15, 325)).background_(Color.white);
s1[8].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\sl3, v);
});
s1[9] = Slider(c4, Rect(55, 35, 15, 325)).background_(Color.white);
s1[9].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\sl4, v);
});
s1[10] = Slider(c4, Rect(70, 35, 15, 325)).background_(Color.white);
s1[10].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\sl5, v);
});
s1[11] = Slider(c4, Rect(90, 35, 15, 325)).background_(Color.black);
s1[11].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\sl_mix, v);
});

//ANTI_HESINBERG ORBITALI P
t1[66] = StaticText(c4, Rect(120, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "2Px";
t1[67] = StaticText(c4, Rect(145, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "2Py";
t1[68] = StaticText(c4, Rect(170, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "2Pz";

t1[69] = StaticText(c4, Rect(195, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Px";
t1[70] = StaticText(c4, Rect(220, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Py";
t1[71] = StaticText(c4, Rect(245, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Pz";

t1[72] = StaticText(c4, Rect(270, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Px";
t1[73] = StaticText(c4, Rect(295, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Py";
t1[74] = StaticText(c4, Rect(320, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Pz";

t1[75] = StaticText(c4, Rect(345, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "5Px";
t1[76] = StaticText(c4, Rect(380, 20, 30, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.black).string = "P";

s1[12] = Slider(c4, Rect(120, 35, 25, 325)).background_(Color.white);
s1[12].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	p.set(\sl1, v);
});
s1[13] = Slider(c4, Rect(145, 35, 25, 325)).background_(Color.white);
s1[13].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	p.set(\sl2, v);
});
s1[14] = Slider(c4, Rect(170, 35, 25, 325)).background_(Color.white);
s1[14].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	p.set(\sl3, v);
});
s1[15] = Slider(c4, Rect(195, 35, 25, 325)).background_(Color.white);
s1[15].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	p.set(\sl4, v);
});
s1[16] = Slider(c4, Rect(220, 35, 25, 325)).background_(Color.white);
s1[16].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	p.set(\sl5, v);
});
s1[17] = Slider(c4, Rect(245, 35, 25, 325)).background_(Color.white);
s1[17].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	r.set(\sl6, v);
});
s1[18] = Slider(c4, Rect(270, 35, 25, 325)).background_(Color.white);
s1[18].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	r.set(\sl7, v);
});
s1[19] = Slider(c4, Rect(295, 35, 25, 325)).background_(Color.white);
s1[19].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	r.set(\sl8, v);
});
s1[20] = Slider(c4, Rect(320, 35, 25, 325)).background_(Color.white);
s1[20].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	r.set(\sl9, v);
});
s1[21] = Slider(c4, Rect(345, 35, 25, 325)).background_(Color.white);
s1[21].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	r.set(\sl10, v);
});
s1[22] = Slider(c4, Rect(375, 35, 15, 325)).background_(Color.black);
s1[22].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	p.set(\sl_mix, v);
	r.set(\sl_mix, v);
});




//ANTI:HEISENBERG ORBITALI D
t1[77] = StaticText(c4, Rect(400, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Dxy";
t1[78] = StaticText(c4, Rect(435, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Dxz";
t1[79] = StaticText(c4, Rect(470, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Dzy";
t1[80] = StaticText(c4, Rect(505, 20, 100, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Dx^2-y^2";
t1[81] = StaticText(c4, Rect(580, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "3Dz^2";

t1[83] = StaticText(c4, Rect(625, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Dxy";
t1[84] = StaticText(c4, Rect(660, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Dxz";
t1[85] = StaticText(c4, Rect(695, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Dzy";
t1[86] = StaticText(c4, Rect(730, 20, 100, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Dx^2-y^2";
t1[87] = StaticText(c4, Rect(805, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "4Dz^2";


t1[89] = StaticText(c4, Rect(860, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.black).string = "D";

s1[23] = Slider(c4, Rect(400, 35, 35, 325)).background_(Color.white);
s1[23].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	d.set(\sl1, v);
});
s1[24] = Slider(c4, Rect(435, 35, 35, 325)).background_(Color.white);
s1[24].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	d.set(\sl2, v);
});
s1[25] = Slider(c4, Rect(470, 35, 35, 325)).background_(Color.white);
s1[25].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	d.set(\sl3, v);
});
s1[26] = Slider(c4, Rect(505, 35, 75, 325)).background_(Color.white);
s1[26].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	d.set(\sl4, v);
});
s1[27] = Slider(c4, Rect(580, 35, 45, 325)).background_(Color.white);
s1[27].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	d.set(\sl5, v);
});
s1[28] = Slider(c4, Rect(625, 35, 35, 325)).background_(Color.white);
s1[28].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	e.set(\sl1, v);
});
s1[29] = Slider(c4, Rect(660, 35, 35, 325)).background_(Color.white);
s1[29].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	e.set(\sl2, v);
});
s1[30] = Slider(c4, Rect(695, 35, 35, 325)).background_(Color.white);
s1[30].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	e.set(\sl3, v);
});
s1[31] = Slider(c4, Rect(730, 35, 75, 325)).background_(Color.white);
s1[31].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	e.set(\sl4, v);
});
s1[32] = Slider(c4, Rect(805, 35, 45, 325)).background_(Color.white);
s1[32].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	e.set(\sl5, v);
});
s1[33] = Slider(c4, Rect(857, 35, 15, 325)).background_(Color.black);
s1[33].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	d.set(\sl_mix, v);
	e.set(\sl_mix, v);
});


//ANTI_HEISENBERG LIVELLI ENERGETICI
t1[90] = StaticText(c4, Rect(890, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "I";
t1[91] = StaticText(c4, Rect(903, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "II";
t1[92] = StaticText(c4, Rect(917, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "III";
t1[93] = StaticText(c4, Rect(932, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "IV";
t1[94] = StaticText(c4, Rect(948, 20, 50, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "V";

s1[34] = Slider(c4, Rect(885, 35, 15, 325));
s1[35] = Slider(c4, Rect(900, 35, 15, 325));
s1[36] = Slider(c4, Rect(915, 35, 15, 325));
s1[37] = Slider(c4, Rect(930, 35, 15, 325));
s1[38] = Slider(c4, Rect(945, 35, 15, 325));


//ANTI-HEISEMBERG
t1[95] = StaticText(c4, Rect(980, 20, 150, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.black).string = "ANTI-HEISENBERG";
t1[96] = StaticText(c4, Rect(980, 360, 150, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.black).string = "PRO-HEISEMBERG";
s1[5] = Slider(c4, Rect(980, 35, 115, 325)).background_(Color.black);
s1[5].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1).postln;
	s.set(\sl_total, v);
	p.set(\sl_total, v);
	r.set(\sl_total, v);
	d.set(\sl_total, v);
	e.set(\sl_total, v);
});

//TEMPERATURE
t1[97] = StaticText(c4, Rect(1100, 10, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "TEMP LEVEL I";
t1[98] = StaticText(c4, Rect(1100, 40, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "TEMP LEVEL II";
t1[99] = StaticText(c4, Rect(1100, 70, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "TEMP LEVEL III";
t1[100] = StaticText(c4, Rect(1100, 100, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "TEMP LEVEL IV";
t1[101] = StaticText(c4, Rect(1100, 130, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "TEMP LEVEL V";
t1[105] = StaticText(c4, Rect(1100, 160, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "TEMP TOTAL";

s1[39] = Slider(c4, Rect(1100, 25, 270, 15));
s1[39].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 10).postln;
	s.set(\temp1s, v);
});



s1[40] = Slider(c4, Rect(1100, 55, 270, 15));
s1[40].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 10).postln;
	s.set(\temp2s, v);
	p.set(\temp2p, v);
});


s1[41] = Slider(c4, Rect(1100, 85, 270, 15));
s1[41].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 10).postln;
	s.set(\temp3s, v);
	p.set(\temp3p, v);
	r.set(\temp3p, v);
	e.set(\temp3d, v);
});



s1[42] = Slider(c4, Rect(1100, 115, 270, 15));
s1[42].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 10).postln;
	s.set(\temp4s, v);
	r.set(\temp4p, v);
	e.set(\temp4d, v);
});



s1[43] = Slider(c4, Rect(1100, 145, 270, 15));
s1[43].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 10).postln;
	s.set(\temp5s, v);
	r.set(\temp5p, v);
});



s1[44] = Slider(c4, Rect(1100, 175, 270, 15));
s1[44].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 5);
	s.set(\temp_total, v);
	p.set(\temp_total, v);
	r.set(\temp_total, v);
	d.set(\temp_total, v);
	e.set(\temp_total, v);
});


//REVERB CONTROL
t1[102] = StaticText(c4, Rect(1100, 300, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "REV";
t1[103] = StaticText(c4, Rect(1100, 315, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "DUMP";
t1[104] = StaticText(c4, Rect(1100, 330, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "ROOM";
t1[105] = StaticText(c4, Rect(1100, 345, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "DIFFUSE";

s1[45] = Slider(c4, Rect(1150, 300, 270, 15));
s1[45].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\rev, v);
	p.set(\rev, v);
	r.set(\rev, v);
	d.set(\rev, v);
	e.set(\rev, v);
});
s1[46] = Slider(c4, Rect(1150, 315, 270, 15));
s1[46].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\dump, v);
	p.set(\dump, v);
	r.set(\dump, v);
	d.set(\dump, v);
	e.set(\dump, v);
});

s1[47] = Slider(c4, Rect(1150, 330, 270, 15));
s1[47].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\room, v);
	p.set(\room, v);
	r.set(\room, v);
	d.set(\room, v);
	e.set(\room, v);
});
s1[50] = Slider(c4, Rect(1150, 345, 270, 15));
s1[50].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	s.set(\diff, v);
	p.set(\diff, v);
	r.set(\diff, v);
	d.set(\diff, v);
	e.set(\diff, v);
});

//VOLUMI DELLE DUE SONIFICAZIONI
t1[105] = StaticText(c4, Rect(1100, 200, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "SonVec";
t1[106] = StaticText(c4, Rect(1100, 230, 250, 15)).background_(Color.grey(0.7,1)).stringColor_(Color.white).string = "SonPro";

s1[48] = Slider(c4, Rect(1100, 215, 270, 15));
s1[48].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	i.set(\master2, v);
	l.set(\master2, v);
	m.set(\master2, v);
	q.set(\master2, v);
});
s1[49] = Slider(c4, Rect(1100, 245, 270, 15));
s1[49].action_({ arg me;
	var v = me.value.linlin(0, 1, 0, 1);
	a.set(\master1, v);
	g.set(\master1, v);
	h.set(\master1, v);

});






//FUNZIONI
//FUNZIONE TEMP DI EBOLLIZIONE
f_temp_bol = { arg press = 1;
	var r,lambda_vapor,temp_ebol,temp_ebol_new,press_atm,log_press;

press_atm = 1; //espressa in atmosfere
r = 0.08206; //costante universale dei gas
//calore latente di vaporizzazione
lambda_vapor = 295.8;
//temperatura di ebollizione
temp_ebol = 2875; //kelvin


log_press = log(press_atm/press);

	//eq. Clausius-Clapeyron
	temp_ebol_new = 1/((1/temp_ebol)-(log_press*r/lambda_vapor));
};

//FUNZIONE TEMP DI FUSIONE
f_temp_fus = { arg press = 1;
var r,lambda_fusione,temp_fusione,temp_fusione_new,press_atm,log_press;

press_atm = 1; //espressa in atmosfere
r = 0.08206; //costante universale dei gas

//calore latente di fusione
lambda_fusione = 7.029;
//temperatura di fusione
temp_fusione = 505.08; //kelvin
log_press = log(press_atm/press);

	//eq. Clausius-Clapeyron
	temp_fusione_new = 1/((1/temp_fusione)-(log_press*r/lambda_fusione));
};


//VELOCITA' DEL SUONO FLUID0
f_vel_suono_fluid ={ arg temp;

var r = 0.08206, //costante universale dei gas
	r_unit_mass,m = 0.118710 ,//massa atomica UMA "kg"
	vel_FLUID,y = 1.2;//coefficiente di dilatazione adibatica;
r_unit_mass = (r*100)/m;

	vel_FLUID = sqrt(y*r_unit_mass*temp);
 };

//VELOCITA' DEL SUONO SOLIDO
f_vel_suono_solid = {arg dens_SOLID;
	var vel_SOLID,young = 40000;//modulo di Young

	vel_SOLID = sqrt(young/dens_SOLID)*1000;
};


//DENSITA' GAS
f_density_gas ={ arg temp, press;
	var volume,
	r = 0.08206, //costante universale dei gas
	m = 0.118710 ,//massa atomica UMA "kg"
dens_GAS;
//densità = massa/volume
//legge dei gas p*v = n*R*T
volume = (r*temp/press);

	dens_GAS = m/volume;
};

//DENSITA' SOLIDO-LIQUIDO
f_density_solid ={arg temp;
	var c_d_a = 0.0000689,//coefficiente di dilatazione cubica
temp_celsius = temp-273.15,dil_ter,dens_SOLID,
	m = 0.118710 ,//massa atomica UMA "kg"
vol_mol = 16.29*pow(10,-6);//volume molare

	//dilatazione termica cubica
dil_ter = vol_mol*(1+(c_d_a*temp_celsius));

	dens_SOLID = (m/dil_ter);
 };


)































