// ------------------------------------------------------------
// periphonic (3D) decoder (8-channels arranged as a cube)
// define encoder / decoder matrices
~encoder = FoaEncoderMatrix.newOmni;
~decoder = FoaDecoderMatrix.newPeri;
// inspect
~encoder.kind;
~encoder.numChannels;
~encoder.dirChannels;

~decoder.kind;
~decoder.numChannels;
~decoder.dirChannels*180/pi;

(
z= {
	arg a_min,a_max,s;
	var a_dif;


	a_dif =  (a_max-a_min);

	v = ((s)*a_dif+a_min);
};
)


//DICHIARAZIONI VARIABILI e  CREAZIONE BUS
b = Bus.audio(s, 30);



(var ss;
//SYNTH SONIFICATION PROPERTIES
//orbital S

ss = SynthDef(\S, {

	arg out1,out2,out3,out4,out5,
	atomic_radius = 140,
	atomic_weight = 118.710,
	uuo_atomic_weight = 294,
	electronegativity = 1.96,
	temp1 ,
	press,
	density,
	speed;

var rate,freq,freqmod,amp,modamp,phase,volume,modphase,a= Array.fill(10),asum1,asum2;

	rate = SinOsc.kr(speed/100,0,1pi);//speed

	freqmod = SinOsc.kr(temp1,rate,density*temp1);//density,temp

	amp = atomic_weight/uuo_atomic_weight;
	modamp = SinOsc.kr(press,rate,amp);//press

	phase = electronegativity;
	volume = atomic_weight/density;
	modphase = (SinOsc.kr(volume,rate,phase));//volume

	//1S
	   freq = atomic_radius/5;
	a[0] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);

    //2S
		   freq = atomic_radius/4;
	a[2] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);

	//3S
		   freq = atomic_radius/3;
	a[4] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);

	//4S
		   freq = atomic_radius/2;
	a[6] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);

	//5S
		   freq = atomic_radius/1;
	a[8] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);

	Out.ar(out1, a[0]);
	Out.ar(out2, a[2]);
	Out.ar(out3, a[4]);
	Out.ar(out4, a[6]);
	Out.ar(out5, a[8]);

	}).add;

ss = Synth.new(\S, [\out1, b.index,\out2, b.index+1,\out3, b.index+2,\out4, b.index+3,\out5, b.index+4]) ;

)

(
//orbital P

p = SynthDef(\P, {

arg out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,
	atomic_radius = 140,
	atomic_weight = 118.710,
	uuo_atomic_weight = 294,
	electronegativity = 1.96,
	temp1 ,
	press,
	density,
	speed;

var rate,freq,freqmod,amp,modamp,phase,volume,modphase,a= Array.fill(20),asum1,asum2;

	//first level
	rate = SinOsc.kr(speed/100,0,1pi);//speed

	freqmod = SinOsc.kr(temp1,rate,density*temp1);//density,temp

	amp = atomic_weight/uuo_atomic_weight;
	modamp = SinOsc.kr(press,rate,amp);//press

	phase = electronegativity;
	volume = atomic_weight/density;
	modphase = (SinOsc.kr(volume,rate,phase));//volume

	//second level

	rate = SinOsc.kr((speed/100)+rate,0,1pi);//speed

	freqmod = SinOsc.kr(temp1+freqmod,rate,density*(temp1+freqmod));//density,temp

	amp = atomic_weight/uuo_atomic_weight;
	modamp = SinOsc.kr(press+modamp,rate,amp);//press

	phase = electronegativity;
	volume = atomic_weight/density;
	modphase = (SinOsc.kr(volume,rate,phase));//volume




	//2P
	freq = (atomic_radius/4)*2;
	a[0] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
    a[2] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[4] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	//3P
	freq = (atomic_radius/3)*2;
	a[6] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[8] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[10] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	//4P
	freq = (atomic_radius/2)*2;
	a[12] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
  	a[14] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[16] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	//5P
	freq = (atomic_radius/1)*2;
	a[18] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);




	Out.ar(out1, a[0]);
	Out.ar(out2, a[2]);
	Out.ar(out3, a[4]);
	Out.ar(out4, a[6]);
	Out.ar(out5, a[8]);
	Out.ar(out6, a[10]);
	Out.ar(out7, a[12]);
	Out.ar(out8, a[14]);
	Out.ar(out9, a[16]);
	Out.ar(out10, a[18]);


	}).add;

p = Synth.new(\P, [\out1, b.index+5,\out2, b.index+6,\out3, b.index+7,\out4, b.index+8,\out5, b.index+9,\out6, b.index+10,\out7, b.index+11,\out8, b.index+12,\out9, b.index+13,\out10, b.index+14]) ;


)
(
//orbital D

d = SynthDef(\D, {

arg out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,
	atomic_radius = 140,
	atomic_weight = 118.710,
	uuo_atomic_weight = 294,
	electronegativity = 1.96,
	temp1 ,
	press,
	density,
	speed;

var rate,freq,freqmod,amp,modamp,phase,volume,modphase,a= Array.fill(20),asum1,asum2;

	//first level
	rate = SinOsc.kr(speed/100,0,1pi);//speed

	freqmod = SinOsc.kr(temp1,rate,density*temp1);//density,temp

	amp = atomic_weight/uuo_atomic_weight;
	modamp = SinOsc.kr(press,rate,amp);//press

	phase = electronegativity;
	volume = atomic_weight/density;
	modphase = (SinOsc.kr(volume,rate,phase));//volume

	//second level

	rate = SinOsc.kr((speed/100)+rate,0,1pi);//speed

	freqmod = SinOsc.kr(temp1+freqmod,rate,density*(temp1+freqmod));//density,temp

	amp = atomic_weight/uuo_atomic_weight;
	modamp = SinOsc.kr(press+modamp,rate,amp);//press

	phase = electronegativity;
	volume = atomic_weight/density;
	modphase = (SinOsc.kr(volume,rate,phase));//volume

	//third level

	rate = SinOsc.kr((speed/100)+rate,0,1pi);//speed

	freqmod = SinOsc.kr(temp1+freqmod,rate,density*(temp1+freqmod));//density,temp

	amp = atomic_weight/uuo_atomic_weight;
	modamp = SinOsc.kr(press+modamp,rate,amp);//press

	phase = electronegativity;
	volume = atomic_weight/density;
	modphase = (SinOsc.kr(volume,rate,phase));//volume


	//3D
	freq = (atomic_radius/3)*3;
	a[0] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[2] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[4] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
  	a[6] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[8] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	//4D
	freq = (atomic_radius/2)*3;
	a[10] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[12] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[14] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
   	a[16] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);
	a[18] =SinOsc.ar(freq+freqmod,phase+modphase,amp+modamp);





	Out.ar(out1, a[0]);
	Out.ar(out2, a[2]);
	Out.ar(out3, a[4]);
	Out.ar(out4, a[6]);
	Out.ar(out5, a[8]);
	Out.ar(out6, a[10]);
	Out.ar(out7, a[12]);
	Out.ar(out8, a[14]);
	Out.ar(out9, a[16]);
	Out.ar(out10, a[18]);

	}).add;

d = Synth.new(\D, [\out1, b.index+15,\out2, b.index+16,\out3, b.index+17,\out4, b.index+18,\out5, b.index+19,\out6, b.index+20,\out7, b.index+21,\out8, b.index+22,\out9, b.index+23,\out10, b.index+24]) ;



)

//SYNTH SONIFICATION VECTORIAL
//vectorial space tin
// I  SYNTH
(var vec1;
vec1 = SynthDef(\vec_tin1, {


arg f1=500,f2,f3,f4,f5,a1=1,a2=1,a3=1,a4=1,a5=1,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5;

	var sin = Array.fill(50), outs, out = Array.fill(20), pg = 1*pi;

	// fond
	sin[0] = SinOsc.ar(f1,p1*pg,a1);
	sin[1] = SinOsc.ar(f2,p2*pg,a2);
	sin[2] = SinOsc.ar(f3,p3*pg,a4);
	sin[3] = SinOsc.ar(f4,p4*pg,a4);
	sin[4] = SinOsc.ar(f5,p5*pg,a5);

	out[0] = (sin[0]+sin[1]+sin[2]+sin[3]+sin[4])/5;

	//prima serie
	sin[5] = SinOsc.ar(f1+f2,
		((p1+p2)/2)*pg,
		(a1+a2)/2);
	sin[6] = SinOsc.ar(f2+f3,
		((p2+p3)/2)*pg,
		(a2+a3)/2);
	sin[7] = SinOsc.ar(f3+f4,
		((p3+p4)/2)*pg,
		(a3+a4)/2);
	sin[8] = SinOsc.ar(f4+f5,
		((a4+a5)/2)*pg,
		(a4+a5)/2);

	out[1] = (sin[5]+sin[6]+sin[7]+sin[8])/4;

	// seconda serie
	sin[9] = SinOsc.ar(f1+(f2*2)+f3,
		((p1+(p2*2)+p3)/4)*pg,
		(a1+(a2*2)+a3)/4);
	sin[10] = SinOsc.ar(f2+(f3*2)+f4,
		((p2+(p3*2)+p4)/4)*pg,
		(a2+(a3*2)+a4)/4);
	sin[11] = SinOsc.ar(f3+(f4*2)+f5,
		((p3+(p4*2)+p5)/4)*pg,
		(a3+(a4*2)+a5)/4);

	out[2] = (sin[9]+sin[10]+sin[11])/3;

	// terza serie
	sin[12] = SinOsc.ar(f1+(f2*3)+(f3*3)+(f4),
		((p1+(p2*3)+(p3*3)+(p4))/8)*pg,
		(a1+(a2*3)+(a3*3)+(a4))/8);
	sin[13] = SinOsc.ar(f2+(f3*3)+(f4*3)+f5,
		((p2+(p3*3)+(p4*3)+p5)/8)*pg,
		(a2+(a3*3)+(a4*3)+a5)/8);

	out[3] = (sin[12]+sin[13])/2;

	// quarta serie
	sin[14] = SinOsc.ar(f1+(f2*4)+(f3*6)+(f4*4)+f5,
		((p1+(p2*4)+(p3*6)+(p4*4)+p5)/16)*pg,
		(a1+(a2*4)+(a3*6)+(a4*4)+a5)/16);

	out[4] = (sin[14]);

	Out.ar(out1,out[0]);
	Out.ar(out2,out[1]);
	Out.ar(out3,out[2]);
	Out.ar(out4,out[3]);
	Out.ar(out5,out[4]);

	}).add;

vec1 = Synth.new(\vec_tin1, [\out1, b.index,\out2, b.index+1,\out3, b.index+2,\out4, b.index+3,\out5, b.index+4]) ;
)

(var vec2;
// II SYNTH
vec2 = SynthDef(\vec_tin2, {

arg f1=500,f2,f3,f4,f5,a1=1,a2=1,a3=1,a4=1,a5=1,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5;

	var sin = Array.fill(50), outs, out = Array.fill(20), pg = 1*pi;


	//fond sinistra
	sin[15] = SinOsc.ar(f1,
		((p1)/1)*pg,
		(a1)/1);
	sin[16] = SinOsc.ar(f1+f2,
		((p1+p2)/2)*pg,
		(a1+a2)/2);
	sin[17] = SinOsc.ar(f1+(f2*2)+f3,
		((p1+(p2*2)+p3)/4)*pg,
		(a1+(a2*2)+a3)/4);
	sin[18] = SinOsc.ar(f1+(f2*3)+(f3*3)+f4,
		((p1+(p2*3)+(p3*3)+p4)/8)*pg,
		(a1+(a2*3)+(a3*3)+a4)/8);
	sin[19] = SinOsc.ar(f1+(f2*4)+(f3*6)+(f4*4)+f5,
		((p1+(p2*4)+(p3*6)+(p4*4)+p5)/16)*pg,
		(a1+(a2*4)+(a3*6)+(a4*4)+a5)/16);

	out[6] = (sin[15]+sin[16]+sin[17]+sin[18]+sin[19])/5;

	//sinistra prima serie
	sin[20] = SinOsc.ar((f1*2)+f2,
		(((p1*2)+p2)/3)*pg,
		((a1*2)+a2)/3);
	sin[21] = SinOsc.ar((f1*2)+(f2*3)+f3,
		(((p1*2)+(p2*3)+p3)/6)*pg,
		((a1*2)+(a2*3)+a3)/6);
	sin[22] = SinOsc.ar((f1*2)+(f2*5)+(f3*4)+f4,
		(((p1*2)+(p2*5)+(p3*4)+p4)/12)*pg,
		((a1*2)+(a2*5)+(a3*4)+a4)/12);
	sin[23] = SinOsc.ar((f1*2)+(f2*7)+(f3*9)+(f4*5)+f5,
		(((p1*2)+(p2*7)+(p3*9)+(p4*5)+p5)/24)*pg,
		((a1*2)+(a2*7)+(a3*9)+(a4*5)+a5)/24);

	out[7] = (sin[20]+sin[21]+sin[22]+sin[23])/4;

	//sinistra seconda serie
	sin[24] = SinOsc.ar((f1*4)+(f2*4)+f3,
		(((p1*4)+(p2*4)+p3)/9)*pg,
		((a1*4)+(a2*4)+a3)/9);
	sin[25] = SinOsc.ar((f1*4)+(f2*8)+(f3*5)+f4,
		(((p1*4)+(p2*8)+(p3*5)+p4)/18)*pg,
		((a1*4)+(a2*8)+(a3*5)+a4)/18);
	sin[26] = SinOsc.ar((f1*4)+(f2*12)+(f3*13)+(f4*6)+f5,
		(((p1*4)+(p2*12)+(p3*13)+(p4*6)+p5)/36)*pg,
		((a1*4)+(a2*12)+(a3*13)+(a4*6)+a5)/36);

	out[8] = (sin[24]+sin[25]+sin[26])/3;

	//sinistra terza serie
	sin[27] = SinOsc.ar((f1*8)+(f2*12)+(f3*6)+f4,
		(((p1*8)+(p2*12)+(p3*6)+p4)/27)*pg,
		((a1*8)+(a2*12)+(a3*6)+a4)/27);
	sin[28] = SinOsc.ar((f1*8)+(f2*20)+(f3*18)+(f4*7)+f5,
		(((p1*8)+(p2*20)+(p3*18)+(p4*7)+p5)/54)*pg,
		((a1*8)+(a2*20)+(a3*18)+(a4*7)+a5)/54);

	out[9] = (sin[27]+sin[28])/2;

	//sinistra quarta serie
	sin[29] = SinOsc.ar((f1*16)+(f2*32)+(f3*24)+(f4*8)+f5,
		(((p1*16)+(p2*32)+(p3*24)+(p4*8)+p5)/81)*pg,
		((a1*16)+(a2*32)+(a3*24)+(a4*8)+a5)/81);

	out[10] = sin[29];



	Out.ar(out1,out[6]);
	Out.ar(out2,out[7]);
	Out.ar(out3,out[8]);
	Out.ar(out4,out[9]);
	Out.ar(out5,out[10]);

	}).add;

vec2 = Synth.new(\vec_tin2, [\out1, b.index+5,\out2, b.index+6,\out3, b.index+7,\out4, b.index+8,\out5, b.index+9]) ;

)

(var vec3;

// III SYNTH

vec3 = SynthDef(\vec_tin3, {

arg f1=500,f2,f3,f4,f5,a1=1,a2=1,a3=1,a4=1,a5=1,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5;

	var sin = Array.fill(50), outs, out = Array.fill(20),div_amp1 = 16, pg = 1*pi;




	//fond destra
	sin[30] = SinOsc.ar(f5,
		((p5)/1)*pg,
		(a5)/1);
	sin[31] = SinOsc.ar(f5+f4,
		((p5+p4)/2)*pg,
		(a5+a4)/2);
	sin[32] = SinOsc.ar(f5+(f4*2)+f3,
		((p5+(p4*2)+p3)/4)*pg,
		(a5+(a4*2)+a3)/4);
	sin[33] = SinOsc.ar(f5+(f4*3)+(f3*3)+f2,
		((p5+(p4*3)+(p3*3)+p2)/8)*pg,
		(a5+(a4*3)+(a3*3)+a2)/8);
	sin[34] = SinOsc.ar(f5+(f4*4)+(f3*6)+(f2*4)+f1,
		((p5+(p4*4)+(p3*6)+(p2*4)+p1)/16)*pg,
		(a5+(a4*4)+(a3*6)+(a2*4)+a1)/16);

	out[12] = (sin[30]+sin[31]+sin[32]+sin[33]+sin[34])/5;

	//destra prima serie
	sin[35] = SinOsc.ar((f5*2)+f4,
		(((p5*2)+p4)/3)*pg,
		((a5*2)+a4)/3);
	sin[36] = SinOsc.ar((f5*2)+(f4*3)+f3,
		(((p5*2)+(p4*3)+p3)/6)*pg,
		((a5*2)+(a4*3)+a3)/6);
	sin[37] = SinOsc.ar((f5*2)+(f4*5)+(f3*4)+f2,
		(((p5*2)+(p4*5)+(p3*4)+p2)/12)*pg,
		((a5*2)+(a4*5)+(a3*4)+a2)/12);
	sin[38] = SinOsc.ar((f5*2)+(f4*7)+(f3*9)+(f2*5)+f1,
		(((p5*2)+(p4*7)+(p3*9)+(p2*5)+p1)/24)*pg,
		((a5*2)+(a4*7)+(a3*9)+(a2*5)+a1)/24);

	out[13] = (sin[35]+sin[36]+sin[37]+sin[38])/4;

	//destra seconda serie
	sin[39] = SinOsc.ar((f5*4)+(f4*4)+f3,
		(((p5*4)+(p4*4)+p3)/9)*pg,
		((a5*4)+(a4*4)+a3)/9);
	sin[40] = SinOsc.ar((f5*4)+(f4*8)+(f3*5)+f2,
		(((p5*4)+(p4*8)+(p3*5)+p2)/18)*pg,
		((a5*4)+(a4*8)+(a3*5)+a2)/18);
	sin[41] = SinOsc.ar((f5*4)+(f4*12)+(f3*13)+(f2*6)+f1,
		(((p5*4)+(p4*12)+(p3*13)+(p2*6)+p1)/36)*pg,
		((a5*4)+(a4*12)+(a3*13)+(a2*6)+a1)/36);

	out[14] = (sin[39]+sin[40]+sin[41])/3;

	//destra terza serie
	sin[42] = SinOsc.ar((f5*8)+(f4*12)+(f3*6)+f2,
		(((p5*8)+(p4*12)+(p3*6)+p2)/27)*pg,
		((a5*8)+(a4*12)+(a3*6)+a2)/27);
	sin[43] = SinOsc.ar((f5*8)+(f4*20)+(f3*18)+(f2*7)+f1,
		(((p5*8)+(p4*20)+(p3*18)+(p2*7)+p1)/54)*pg,
		((a5*8)+(a4*20)+(a3*18)+(a2*7)+a1)/54);

	out[15] = (sin[42]+sin[43])/2;

	//destra quarta serie
	sin[44] = SinOsc.ar((f5*16)+(f4*32)+(f3*24)+(f2*8)+f1,
		(((p5*16)+(p4*32)+(p3*24)+(p2*8)+p1)/81)*pg,
		((a5*16)+(a4*32)+(a3*24)+(a2*8)+a1)/81);

	out[16] = sin[44];



	Out.ar(out1,out[12]);
	Out.ar(out2,out[13]);
	Out.ar(out3,out[14]);
	Out.ar(out4,out[15]);
	Out.ar(out5,out[16]);

	}).add;

vec3 = Synth.new(\vec_tin3, [\out1, b.index+10,\out2, b.index+11,\out3, b.index+12,\out4, b.index+13,\out5, b.index+14]);

)

(var vec4;
//IV SYNTH

vec4 = SynthDef(\vec_tin4, {

arg f1=500,f2,f3,f4,f5,a1=1,a2=1,a3=1,a4=1,a5=1,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10;

	var sin = Array.fill(50), outs, out = Array.fill(20),div_amp1 = 16, pg = 1*pi;

	//fond final
	sin[45] = SinOsc.ar((f1*31)+(f2*75)+(f3*70)+(f4*30)+(f5*5),
		(((p1*31)+(p2*75)+(p3*70)+(p4*30)+(p5*5))/211)*pg,
		((a1*31)+(a2*75)+(a3*70)+(a4*30)+(a5*5))/211);
	sin[46] = SinOsc.ar((f1*16)+(f2*48)+(f3*55)+(f4*29)+(f5*6),
		(((p1*16)+(p2*48)+(p3*55)+(p4*29)+(p5*6))/154)*pg,
		((a1*16)+(a2*48)+(a3*55)+(a4*29)+(a5*6))/154);
	sin[47] = SinOsc.ar((f1*7)+(f2*12)+(f3*50)+(f4*34)+(f5*9),
		(((p1*7)+(p2*12)+(p3*50)+(p4*34)+(p5*9))/112)*pg,
		((a1*7)+(a2*12)+(a3*50)+(a4*34)+(a5*9))/112);
	sin[48] = SinOsc.ar((f1*6)+(f2*29)+(f3*55)+(f4*48)+(f5*16),
		(((p1*6)+(p2*29)+(p3*55)+(p4*48)+(p5*16)/154))*pg,
		((a1*6)+(a2*29)+(a3*55)+(a4*48)+(a5*16)/154));
	sin[49] = SinOsc.ar((f1*5)+(f2*30)+(f3*70)+(f4*75)+(f5*31),
		(((p1*5)+(p2*30)+(p3*70)+(p4*75)+(p5*31))/211)*pg,
		((a1*5)+(a2*30)+(a3*70)+(a4*75)+(a5*31))/211);

	out[0] = sin[45];
	out[1] = sin[46];
	out[2] = sin[47];
	out[3] = sin[48];
	out[4] = sin[49];
	out[5] = sin[45]*2;
	out[6] = sin[46]*2;
	out[7] = sin[47]*2;
	out[8] = sin[48]*2;
	out[9] = sin[49]*2;


	Out.ar(out1,out[0]);
	Out.ar(out2,out[1]);
	Out.ar(out3,out[2]);
	Out.ar(out4,out[3]);
	Out.ar(out5,out[4]);
	Out.ar(out6,out[5]);
	Out.ar(out7,out[6]);
	Out.ar(out8,out[7]);
	Out.ar(out9,out[8]);
	Out.ar(out10,out[9]);

	}).add;

vec4 = Synth.new(\vec_tin4, [\out1, b.index+15,\out2, b.index+16,\out3, b.index+17,\out4, b.index+18,\out5, b.index+19,\out6, b.index+20,\out7, b.index+21,\out8, b.index+22,\out9, b.index+23,\out10, b.index+24]);
)








(

var z1;

z1 =SynthDef(\orbital_S, {arg sig1,sig2,sig3,sig4,sig5,
	sl1= 0.1,sl2= 0.1,sl3= 0.1,sl4= 0.1,sl5= 0.1,sl_mix=0.1,
	temp_total= 0.1,temp1s= 0.1,temp2s= 0.1,temp3s= 0.1,temp4s= 0.1,temp5s= 0.1;
	var sig_mix,
	rev,out;                // audio signal.
    var
	gauss = Array.fill(5),
	angle = Array.fill(5),
	azim = Array.fill(5),
	elevation = Array.fill(5);           // angle and azimuth control



	// display encoder and decoder
	"Ambisonic encoding via % encoder".format(~encoder.kind).postln;
	"Ambisonic decoding via % decoder".format(~decoder.kind).postln;


	sig1 = In.ar(sig1*sl1,1);
	sig2 = In.ar(sig2*sl2,1);
	sig3 = In.ar(sig3*sl3,1);
	sig4 = In.ar(sig4*sl4,1);
	sig5 = In.ar(sig5*sl5,1);

	//ORBITALS  S


	//1S

	gauss[0] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[0] = z.value(0,0.3,((SinOsc.kr((temp1s*temp_total),0,gauss[0],1))/2));
	azim[0] =  SinOsc.kr((temp1s*temp_total),0,gauss[0]);
	elevation[0] = SinOsc.kr((temp1s*temp_total),0,gauss[0]);
//encode
	sig1 = FoaEncode.ar(sig1, ~encoder);
//distance
	sig1 = FoaDirectO.ar(sig1,angle[0]);
//azimut - elevation
   sig1 = FoaTransform.ar(sig1, 'push', pi/2, azim[0],elevation[0]);

	//2S

	gauss[1] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[1] = z.value(0.3,0.6,((SinOsc.kr((temp2s*temp_total),0,gauss[1],1))/2));
	azim[1] =  SinOsc.kr((temp2s*temp_total),0,gauss[1]);
	elevation[1] = SinOsc.kr((temp2s*temp_total),0,gauss[1]);
//encode
    sig2 = FoaEncode.ar(sig2, ~encoder);
//distance
	sig2 = FoaDirectO.ar(sig2,angle[1]);
//azimut - elevation
   sig2 = FoaTransform.ar(sig2, 'push', pi/2, azim[1],elevation[1]);

	//3S

	gauss[2] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[2] = z.value(0.6,0.9,((SinOsc.kr((temp3s*temp_total),0,gauss[2],1))/2));
	azim[2] =  SinOsc.kr((temp3s*temp_total),0,gauss[2]);
	elevation[2] = SinOsc.kr((temp3s*temp_total),0,gauss[2]);

//encode
    sig3 = FoaEncode.ar(sig3, ~encoder);
//distance
	sig3 = FoaDirectO.ar(sig3,angle[2]);
//azimut - elevation
   sig3 = FoaTransform.ar(sig3, 'push', pi/2, azim[2],elevation[2]);

	//4S

	gauss[3] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[3] = z.value(0.9,1.2,((SinOsc.kr((temp4s*temp_total),0,gauss[3],1))/2));
	azim[3] =  SinOsc.kr((temp4s*temp_total),0,gauss[3]);
	elevation[3] = SinOsc.kr((temp4s*temp_total),0,gauss[3]);
//encode
    sig4 = FoaEncode.ar(sig4, ~encoder);
//distance
	sig4 = FoaDirectO.ar(sig4,angle[3]);
//azimut - elevation
   sig4 = FoaTransform.ar(sig4, 'push', pi/2, azim[3],elevation[3]);

	//5S


	gauss[4] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[4] = z.value(1.2,1.5,((SinOsc.kr((temp5s*temp_total),0,gauss[4],1))/2));
	azim[4] =  SinOsc.kr((temp5s*temp_total),0,gauss[4]);
	elevation[4] = SinOsc.kr((temp5s*temp_total),0,gauss[4]);
//encode
    sig5 = FoaEncode.ar(sig5, ~encoder);
//distance
	sig5 = FoaDirectO.ar(sig5,angle[4]);
//azimut - elevation
   sig5 = FoaTransform.ar(sig5, 'push', pi/2, azim[4],elevation[4]);


	sig_mix = (sig1+sig2+sig3+sig4+sig5)/5;

	sig_mix = sig_mix*sl_mix;

	rev = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix: 1, room: 0.999, damp: 1, diffuse: 0.1, mul: 1, add: 0);
	rev = rev*0;
out = sig_mix+rev;
	// decode (to cube)
//   out = FoaDecode.ar(sig_mix+rev, ~decoder);
	Out.ar(0,out);

}).add;

z1 = Synth(\orbital_S, [\sig1,b.index,\sig2,b.index+1,\sig3,b.index+2,\sig4,b.index+3,\sig5,b.index+4],1,\addToTail);z1.run;

)

(
var z2;
//ORBITALE P
z2=SynthDef(\orbital_P, {arg sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sig9,sig10,
	sl1,sl2,sl3,sl4,sl5,sl6,sl7,sl8,sl9,sl10,sl_mix,
	temp_total = 0.1,temp2p= 0.1,temp3p= 0.1,temp4p= 0.1,temp5p= 0.1;
	var sig_mix,
	rev,out;
    var

	gauss = Array.fill(20),
	angle = Array.fill(10),
	azim = Array.fill(10),
	elevation = Array.fill(10);



   // display encoder and decoder
    "Ambisonic encoding via % encoder".format(~encoder.kind).postln;
   "Ambisonic decoding via % decoder".format(~decoder.kind).postln;


	sig1 = In.ar(sig1*sl1,1);
	sig2 = In.ar(sig2*sl2,1);
	sig3 = In.ar(sig3*sl3,1);
	sig4 = In.ar(sig4*sl4,1);
	sig5 = In.ar(sig5*sl5,1);
	sig6 = In.ar(sig6*sl6,1);
	sig7 = In.ar(sig7*sl7,1);
	sig8 = In.ar(sig8*sl8,1);
	sig9 = In.ar(sig9*sl9,1);
	sig10 = In.ar(sig10*sl10,1);



	//ORBITALS  P
	//2Px
	gauss[0] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[0] = z.value(0,0.375,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[0] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2));
			elevation[0] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2));
		),
	(
			azim[0] = z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2));
			elevation[0] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2));
	););
//encode
    sig1 = FoaEncode.ar(sig1, ~encoder);
//distance
	sig1 = FoaDirectO.ar(sig1,angle[0]);
//azimut - elevation
   sig1 = FoaTransform.ar(sig1, 'push', pi/2, azim[0],elevation[0]);





	//2Py
	gauss[1] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[1] = z.value(0,0.375,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[1] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
			elevation[1] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
		),
		(
			azim[1] = z.value(0.875pi,1.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
			elevation[1] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
	););
//encode
    sig2 = FoaEncode.ar(sig2, ~encoder);
//distance
	sig2 = FoaDirectO.ar(sig2,angle[1]);
//azimut - elevation
   sig2 = FoaTransform.ar(sig2, 'push', pi/2, azim[1],elevation[1]);




	//2Pz
	gauss[2] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[2] = z.value(0,0.375,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[2] = z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));
			elevation[2] = z.value(0.375pi,0.5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));
		),
		(
			azim[2] = z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));
			elevation[2] = z.value(-0.5pi,-0.375pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));
	););
//encode
    sig3 = FoaEncode.ar(sig3, ~encoder);
//distance
	sig3 = FoaDirectO.ar(sig3,angle[2]);
//azimut - elevation
   sig3 = FoaTransform.ar(sig3, 'push', pi/2, azim[2],elevation[2]);





	//3Px
	gauss[3] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[3] = z.value(0.375,0.75,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[3] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));
			elevation[3] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));
		),
		(
			azim[3] = z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));
			elevation[3] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));
	););
//encode
    sig4 = FoaEncode.ar(sig4, ~encoder);
//distance
	sig4 = FoaDirectO.ar(sig4,angle[3]);
//azimut - elevation
   sig4 = FoaTransform.ar(sig4, 'push', pi/2, azim[3],elevation[3]);


	//3Py
	gauss[4] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[4] = z.value(0.375,0.75,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[4] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));
			elevation[4] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));
		),
		(
			azim[4] = z.value(0.875pi,1.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));
			elevation[4] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));
	););
//encode
    sig5 = FoaEncode.ar(sig5, ~encoder);
//distance
	sig5 = FoaDirectO.ar(sig5,angle[4]);
//azimut - elevation
   sig5 = FoaTransform.ar(sig5, 'push', pi/2, azim[4],elevation[4]);


	//3Pz
	gauss[5] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[5] = z.value(0.375,0.75,(SinOsc.kr((temp2p*temp_total),0,gauss[5],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[5] = z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[5],1)/2));
			elevation[5] = z.value(0.375pi,0.5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[5],1)/2));
		),
		(
			azim[5] = z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[5],1)/2));
			elevation[5] = z.value(-0.5pi,-0.375pi,(SinOsc.kr((temp2p*temp_total),0,gauss[5],1)/2));
	););
//encode
    sig6 = FoaEncode.ar(sig6, ~encoder);
//distance
	sig6 = FoaDirectO.ar(sig6,angle[5]);
//azimut - elevation
   sig6 = FoaTransform.ar(sig6, 'push', pi/2, azim[5],elevation[5]);


	//4Px
	gauss[6] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[6] =  z.value(0.75,1.125,(SinOsc.kr((temp2p*temp_total),0,gauss[6],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[6] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[6],1)/2));
			elevation[6] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[6],1)/2));
		),
		(
			azim[6] = z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[6],1)/2));
			elevation[6] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[6],1)/2));
	););
//encode
    sig7 = FoaEncode.ar(sig7, ~encoder);
//distance
	sig7 = FoaDirectO.ar(sig7,angle[6]);
//azimut - elevation
   sig7 = FoaTransform.ar(sig7, 'push', pi/2, azim[6],elevation[6]);


	//4Py
	gauss[7] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[7] = z.value(0.75,1.125,(SinOsc.kr((temp2p*temp_total),0,gauss[7],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[7] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[7],1)/2));
			elevation[7] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[7],1)/2));
		),
		(
			azim[7] = z.value(0.875pi,1.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[7],1)/2));
			elevation[7] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[7],1)/2));
	););
//encode
    sig8 = FoaEncode.ar(sig8, ~encoder);
//distance
	sig8 = FoaDirectO.ar(sig8,angle[7]);
//azimut - elevation
   sig8 = FoaTransform.ar(sig8, 'push', pi/2, azim[7],elevation[7]);

	//4Pz
	gauss[8] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[8] = z.value(0.75,1.125,(SinOsc.kr((temp2p*temp_total),0,gauss[8],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[8] = z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[8],1)/2));
			elevation[8] = z.value(0.375pi,0.5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[8],1)/2));
		),
		(
			azim[8] = z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[8],1)/2));
			elevation[8] = z.value(-0.5pi,-0.375pi,(SinOsc.kr((temp2p*temp_total),0,gauss[8],1)/2));
	););
//encode
    sig9 = FoaEncode.ar(sig9, ~encoder);
//distance
	sig9 = FoaDirectO.ar(sig9,angle[8]);
//azimut - elevation
   sig9 = FoaTransform.ar(sig9, 'push', pi/2, azim[8],elevation[8]);

	//5Px
	gauss[9] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[9] =  z.value(1.125,1.5,(SinOsc.kr((temp2p*temp_total),0,gauss[9],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			azim[9] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[9],1)/2));
			elevation[9] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[9],1)/2));
		),
		(
			azim[9] = z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[9],1)/2));
			elevation[9] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[9],1)/2));
	););
//encode
    sig10 = FoaEncode.ar(sig10, ~encoder);
//distance
	sig10 = FoaDirectO.ar(sig10,angle[9]);
//azimut - elevation
   sig10 = FoaTransform.ar(sig10, 'push', pi/2, azim[9],elevation[9]);

	sig_mix = (sig1+sig2+sig3+sig4+sig5+sig6+sig7+sig8+sig9+sig10)/10;

sig_mix = sig_mix*sl_mix;

	rev = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix: 1, room: 0.999, damp: 1, diffuse: 0.1, mul: 1, add: 0);
	rev = rev*0;
out = sig_mix+rev;
	// decode (to cube)
//out = FoaDecode.ar(sig_mix+rev, ~decoder);
	Out.ar(0,out);

}).add;

z2 = Synth(\orbital_P, [\sig1,b.index+5,\sig2,b.index+6,\sig3,b.index+7,\sig4,b.index+8,\sig5,b.index+9,\sig6,b.index+10,\sig7,b.index+11,\sig8,b.index+12,\sig9,b.index+13,\sig10,b.index+14],1,\addToTail);z2.run;


)

(
var z3;
//ORBITALE D
z3 =SynthDef(\orbital_D, {arg sig1,sig2,sig3,sig4,sig5,sig6,sig7,sig8,sig9,sig10,
	sl1,sl2,sl3,sl4,sl5,sl6,sl7,sl8,sl9,sl10,sl_mix,
	temp3d,temp4d,temp_total;
	var sig_mix,
	rev,out;                // audio signal
    var
	gauss = Array.fill(20),
	angle = Array.fill(10),
	azim = Array.fill(10),
	elevation = Array.fill(10);           // angle and azimuth control



   // display encoder and decoder
    "Ambisonic encoding via % encoder".format(~encoder.kind).postln;
   "Ambisonic decoding via % decoder".format(~decoder.kind).postln;


	sig1 = In.ar(sig1*sl1,1);
	sig2 = In.ar(sig2*sl2,1);
	sig3 = In.ar(sig3*sl3,1);
	sig4 = In.ar(sig4*sl4,1);
	sig5 = In.ar(sig5*sl5,1);
	sig6 = In.ar(sig6*sl6,1);
	sig7 = In.ar(sig7*sl7,1);
	sig8 = In.ar(sig8*sl8,1);
	sig9 = In.ar(sig9*sl9,1);
	sig10 = In.ar(sig10*sl10,1);

	//ORBITALS  D




	//3Dxy
	gauss[0] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[0] =  z.value(0,0.75,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[0] = z.value(0.125pi,0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
				elevation[0] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
			),
			(
				azim[0] = z.value(0.625pi,0.875pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
				elevation[0] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
			))
		),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[0] = z.value(-0.375pi,-0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
				elevation[0] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
			),
			(
				azim[0] = z.value(-0.875pi,-0.625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
				elevation[0] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2));
			))

	););


//encode
    sig1 = FoaEncode.ar(sig1, ~encoder);
//distance
	sig1 = FoaDirectO.ar(sig1,angle[0]);
//azimut - elevation
   sig1 = FoaTransform.ar(sig1, 'push', pi/2, azim[0],elevation[0]);

	//3Dxz

	gauss[1] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[1] =  z.value(0,0.75,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[1] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
				elevation[1] = z.value(0.125pi,0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
			),
			(
				azim[1] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
				elevation[1] = z.value(-0.375pi,-0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
			))
		),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[1] = z.value(-0.625pi,-0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
				elevation[1] = z.value(0.125pi,0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
			),
			(
				azim[1] = z.value(-0.625pi,-0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
				elevation[1] = z.value(-0.375pi,-0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2));
			))

	););
//encode
    sig2 = FoaEncode.ar(sig2, ~encoder);
//distance
	sig2 = FoaDirectO.ar(sig2,angle[1]);
//azimut - elevation
   sig2 = FoaTransform.ar(sig2, 'push', pi/2, azim[1],elevation[1]);



	//3Dyz
	gauss[2] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[2] =  z.value(0,0.75,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[2] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
				elevation[2] = z.value(0.125pi,0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
			),
			(
				azim[2] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
				elevation[2] = z.value(-0.375pi,-0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
			))
		),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[2] = z.value(0.875pi,1.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
				elevation[2] = z.value(0.125pi,0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
			),
			(
				azim[2] = z.value(-0.625pi,-0.375pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
				elevation[2] = z.value(0.875pi,1.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2));
			))

	););

//encode
    sig3 = FoaEncode.ar(sig3, ~encoder);
//distance
	sig3 = FoaDirectO.ar(sig3,angle[2]);
//azimut - elevation
   sig3 = FoaTransform.ar(sig3, 'push', pi/2, azim[2],elevation[2]);

	//3Dx^2-y^2

	gauss[3] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[3] =  z.value(0,0.75,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1))/2);

	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[3] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
				elevation[3] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
			),
			(
				azim[3] = z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
				elevation[3] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
			))
		),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				azim[3] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
				elevation[3] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
			),
			(
				azim[3] = z.value(0.875pi,1.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
				elevation[3] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2));
			))

	););
//encode
    sig4 = FoaEncode.ar(sig4, ~encoder);
//distance
	sig4 = FoaDirectO.ar(sig4,angle[3]);
//azimut - elevation
   sig4 = FoaTransform.ar(sig4, 'push', pi/2, azim[3],elevation[3]);




	//3Dz^2
	gauss[4] = TGaussRand.kr(0,1,Dust.kr(1));


	if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(if ((TIRand.kr(0,1,Dust.kr(1)) == 1),
			(
				angle[4] =  z.value(0,0.75,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1))/2);
				azim[4] = z.value(0.375pi,0.625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1)/2));
				elevation[4] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1)/2));
			),
			(
				angle[4] =  z.value(0,0.75,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1))/2);
				azim[4] = z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1)/2));
				elevation[4] = z.value(-0.125pi,0.125pi,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1)/2));
			))
		),
		(
			angle[4] =  z.value(0.375,0.75,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1))/2);
			azim[4] = z.value(-5pi,5pi,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1)/2));
			elevation[4] = z.value(-0.0625pi,0.0625pi,(SinOsc.kr((temp3d*temp_total),0,gauss[4],1)/2));
		);
	);
//encode
    sig5 = FoaEncode.ar(sig5, ~encoder);
//distance
	sig5 = FoaDirectO.ar(sig5,angle[4]);
//azimut - elevation
   sig5 = FoaTransform.ar(sig5, 'push', pi/2, azim[4],elevation[4]);

	//4.1
//encode
    sig6 = FoaEncode.ar(sig6, ~encoder);
//distance
	sig6 = FoaDirectO.ar(sig6,angle[5]);
//azimut - elevation
   sig6 = FoaTransform.ar(sig6, 'push', pi/2, azim[5],elevation[5]);

	//4.2
//encode
    sig7 = FoaEncode.ar(sig7, ~encoder);
//distance
	sig7 = FoaDirectO.ar(sig7,angle[6]);
//azimut - elevation
   sig7 = FoaTransform.ar(sig7, 'push', pi/2, azim[6],elevation[6]);

	//4.3
//encode
    sig8 = FoaEncode.ar(sig8, ~encoder);
//distance
	sig8 = FoaDirectO.ar(sig8,angle[7]);
//azimut - elevation
   sig8 = FoaTransform.ar(sig8, 'push', pi/2, azim[7],elevation[7]);

	//4.4
//encode
    sig9 = FoaEncode.ar(sig9, ~encoder);
//distance
	sig9 = FoaDirectO.ar(sig9,angle[8]);
//azimut - elevation
   sig9 = FoaTransform.ar(sig9, 'push', pi/2, azim[8],elevation[8]);

	//4.5
//encode
    sig10 = FoaEncode.ar(sig10, ~encoder);
//distance
	sig10 = FoaDirectO.ar(sig10,angle[9]);
//azimut - elevation
   sig10 = FoaTransform.ar(sig10, 'push', pi/2, azim[9],elevation[9]);

	sig_mix = (sig1+sig2+sig3+sig4+sig5+sig6+sig7+sig8+sig9+sig10)/10;

	sig_mix = sig_mix*sl_mix;

	rev = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix: 1, room: 0.999, damp: 1, diffuse: 0.1, mul: 1, add: 0);
	rev = rev*0;

out = sig_mix+rev;
	// decode (to cube)
//   out = FoaDecode.ar(sig_mix, ~decoder);
	Out.ar(0,out);

}).add;

z3 = Synth(\orbital_D, [\sig1,b.index+15,\sig2,b.index+16,\sig3,b.index+17,\sig4,b.index+18,\sig5,b.index+19,\sig6,b.index+20,\sig7,b.index+21,\sig8,b.index+22,\sig9,b.index+23,\sig10,b.index+24],1,\addToTail);z3.run;
)

