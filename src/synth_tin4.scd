//DICHIARAZIONI VARIABILI e  CREAZIONE BUS
b = Bus.audio(s, 30);


(
//SYNTH SONIFICATION PROPERTIES
//orbital S

a = SynthDef(\S, {

	arg out1,out2,out3,out4,out5,master1,
	atomic_radius = 140,
	atomic_weight = 118.710,
	uuo_atomic_weight = 294,
	electronegativity = 1.96*1pi,
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

	Out.ar(out1, a[0]*master1);
	Out.ar(out2, a[2]*master1);
	Out.ar(out3, a[4]*master1);
	Out.ar(out4, a[6]*master1);
	Out.ar(out5, a[8]*master1);

}).add;




//orbital P

g = SynthDef(\P, {

	arg out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,master1,
	atomic_radius = 140,
	atomic_weight = 118.710,
	uuo_atomic_weight = 294,
	electronegativity = 1.96*1pi,
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




	Out.ar(out1, a[0]*master1);
	Out.ar(out2, a[2]*master1);
	Out.ar(out3, a[4]*master1);
	Out.ar(out4, a[6]*master1);
	Out.ar(out5, a[8]*master1);
	Out.ar(out6, a[10]*master1);
	Out.ar(out7, a[12]*master1);
	Out.ar(out8, a[14]*master1);
	Out.ar(out9, a[16]*master1);
	Out.ar(out10, a[18]*master1);


}).add;





//orbital D

h = SynthDef(\D, {

	arg out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,master1,
	atomic_radius = 140,
	atomic_weight = 118.710,
	uuo_atomic_weight = 294,
	electronegativity = 1.96*1pi,
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





	Out.ar(out1, a[0]*master1);
	Out.ar(out2, a[2]*master1);
	Out.ar(out3, a[4]*master1);
	Out.ar(out4, a[6]*master1);
	Out.ar(out5, a[8]*master1);
	Out.ar(out6, a[10]*master1);
	Out.ar(out7, a[12]*master1);
	Out.ar(out8, a[14]*master1);
	Out.ar(out9, a[16]*master1);
	Out.ar(out10, a[18]*master1);

}).add;


)





//SYNTH SONIFICATION VECTORIAL
//vectorial space tin
// I  SYNTH
(
i = SynthDef(\vec_tin1, {


	arg master2,f1,f2,f3,f4,f5,a1,a2,a3,a4,a5,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5,fmod,amod,pmod,min,max,trig,on_off,minamp,maxamp,minphase,maxphase,trigamp,trigphase;

	var sin = Array.fill(50), outs, out = Array.fill(20), pg = 1*pi,
	freqmod,ampmod,phasemod,frand,arand,prand;

	//trig freq
	trig = Dust.kr(trig);
	frand = TGaussRand.kr(min,max,trig);
	frand = frand*on_off;
	f1=f1+frand;
	f2=f2+frand;
	f3=f3+frand;
	f4=f4+frand;
	f5=f5+frand;

	//trig amp
	trigamp = Dust.kr(trigamp);
	arand = TGaussRand.kr(minamp,maxamp,trigamp);
	arand = arand*on_off;
	a1=a1+arand;
	a2=a2+arand;
	a3=a3+arand;
	a4=a4+arand;
	a5=a5+arand;

	//trig phase
	trigphase = Dust.kr(trigphase);
	prand = TGaussRand.kr(minphase,maxphase,trigphase);
	prand = prand*on_off;
	p1=p1+prand;
	p2=p2+prand;
	p3=p3+prand;
	p4=p4+prand;
	p5=p5+prand;

	//modulaizoni
	freqmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*fmod,0,(f1+f2+f3+f4+f5));
	ampmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*amod,0,(f1+f2+f3+f4+f5));
	phasemod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*pmod,0,(f1+f2+f3+f4+f5));
	phasemod = phasemod*1pi;

	// fond
	sin[0] = SinOsc.ar(f1+freqmod,(p1*pg)+phasemod,a1+ampmod);
	sin[1] = SinOsc.ar(f2+freqmod,(p2*pg)+phasemod,a2+ampmod);
	sin[2] = SinOsc.ar(f3+freqmod,(p3*pg)+phasemod,a4+ampmod);
	sin[3] = SinOsc.ar(f4+freqmod,(p4*pg)+phasemod,a4+ampmod);
	sin[4] = SinOsc.ar(f5+freqmod,(p5*pg)+phasemod,a5+ampmod);

	out[0] = (sin[0]+sin[1]+sin[2]+sin[3]+sin[4])/5;

	//prima serie
	sin[5] = SinOsc.ar((f1+f2)+freqmod,
		(((p1+p2)/2)*pg)+phasemod,
		((a1+a2)/2)+ampmod);
	sin[6] = SinOsc.ar((f2+f3)+freqmod,
		(((p2+p3)/2)*pg)+phasemod,
		((a2+a3)/2)+ampmod);
	sin[7] = SinOsc.ar((f3+f4)+freqmod,
		(((p3+p4)/2)*pg)+phasemod,
		((a3+a4)/2)+ampmod);
	sin[8] = SinOsc.ar((f4+f5)+freqmod,
		(((p4+p5)/2)*pg+phasemod),
		((a4+a5)/2)+ampmod);

	out[1] = (sin[5]+sin[6]+sin[7]+sin[8])/4;

	// seconda serie
	sin[9] = SinOsc.ar((f1+(f2*2)+f3)+freqmod,
		(((p1+(p2*2)+p3)/4)*pg)+phasemod,
		((a1+(a2*2)+a3)/4)+ampmod);
	sin[10] = SinOsc.ar((f2+(f3*2)+f4)+freqmod,
		(((p2+(p3*2)+p4)/4)*pg)+phasemod,
		((a2+(a3*2)+a4)/4)+ampmod);
	sin[11] = SinOsc.ar((f3+(f4*2)+f5)+freqmod,
		(((p3+(p4*2)+p5)/4)*pg)+phasemod,
		((a3+(a4*2)+a5)/4)+ampmod);

	out[2] = (sin[9]+sin[10]+sin[11])/3;

	// terza serie
	sin[12] = SinOsc.ar((f1+(f2*3)+(f3*3)+(f4))+freqmod,
		(((p1+(p2*3)+(p3*3)+(p4))/8)*pg)+phasemod,
		((a1+(a2*3)+(a3*3)+(a4))/8)+ampmod);
	sin[13] = SinOsc.ar((f2+(f3*3)+(f4*3)+f5)+freqmod,
		(((p2+(p3*3)+(p4*3)+p5)/8)*pg)+phasemod,
		((a2+(a3*3)+(a4*3)+a5)/8)+ampmod);

	out[3] = (sin[12]+sin[13])/2;

	// quarta serie
	sin[14] = SinOsc.ar((f1+(f2*4)+(f3*6)+(f4*4)+f5)+freqmod,
		(((p1+(p2*4)+(p3*6)+(p4*4)+p5)/16)*pg)+phasemod,
		((a1+(a2*4)+(a3*6)+(a4*4)+a5)/16)+ampmod);

	out[4] = (sin[14]);

	master2 = master2*0.01;

	Out.ar(out1,out[0]*master2);
	Out.ar(out2,out[1]*master2);
	Out.ar(out3,out[2]*master2);
	Out.ar(out4,out[3]*master2);
	Out.ar(out5,out[4]*master2);

}).add;



// II SYNTH
l = SynthDef(\vec_tin2, {

	arg master2,f1,f2,f3,f4,f5,a1,a2,a3,a4,a5,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5,fmod,amod,pmod,
	min,max,trig,on_off,minamp,maxamp,minphase,maxphase,trigamp,trigphase;

	var sin = Array.fill(50), outs, out = Array.fill(20), pg = 1*pi,
	freqmod,ampmod,phasemod,frand,arand,prand;

	//trig freq
	trig = Dust.kr(trig);
	frand = TGaussRand.kr(min,max,trig);
	frand = frand*on_off;
	f1=f1+frand;
	f2=f2+frand;
	f3=f3+frand;
	f4=f4+frand;
	f5=f5+frand;

	//trig amp
	trigamp = Dust.kr(trigamp);
	arand = TGaussRand.kr(minamp,maxamp,trigamp);
	arand = arand*on_off;
	a1=a1+arand;
	a2=a2+arand;
	a3=a3+arand;
	a4=a4+arand;
	a5=a5+arand;

	//trig phase
	trigphase = Dust.kr(trigphase);
	prand = TGaussRand.kr(minphase,maxphase,trigphase);
	prand = prand*on_off;
	p1=p1+prand;
	p2=p2+prand;
	p3=p3+prand;
	p4=p4+prand;
	p5=p5+prand;

	//modulaizoni
	freqmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*fmod,0,(f1+f2+f3+f4+f5));
	ampmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*amod,0,(f1+f2+f3+f4+f5));
	phasemod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*pmod,0,(f1+f2+f3+f4+f5));
	phasemod = phasemod*1pi;


	//fond sinistra
	sin[15] = SinOsc.ar(f1+freqmod,
		(((p1)/1)*pg)+phasemod,
		((a1)/1)+ampmod);
	sin[16] = SinOsc.ar((f1+f2)+freqmod,
		(((p1+p2)/2)*pg)+phasemod,
		((a1+a2)/2)+ampmod);
	sin[17] = SinOsc.ar((f1+(f2*2)+f3)+freqmod,
		(((p1+(p2*2)+p3)/4)*pg)+phasemod,
		((a1+(a2*2)+a3)/4)+ampmod);
	sin[18] = SinOsc.ar((f1+(f2*3)+(f3*3)+f4)+freqmod,
		(((p1+(p2*3)+(p3*3)+p4)/8)*pg)+phasemod,
		((a1+(a2*3)+(a3*3)+a4)/8)+ampmod);
	sin[19] = SinOsc.ar((f1+(f2*4)+(f3*6)+(f4*4)+f5)+freqmod,
		(((p1+(p2*4)+(p3*6)+(p4*4)+p5)/16)*pg)+phasemod,
		((a1+(a2*4)+(a3*6)+(a4*4)+a5)/16)+ampmod);

	out[6] = (sin[15]+sin[16]+sin[17]+sin[18]+sin[19])/5;

	//sinistra prima serie
	sin[20] = SinOsc.ar(((f1*2)+f2)+freqmod,
		((((p1*2)+p2)/3)*pg)+phasemod,
		(((a1*2)+a2)/3)+ampmod);
	sin[21] = SinOsc.ar(((f1*2)+(f2*3)+f3)+freqmod,
		((((p1*2)+(p2*3)+p3)/6)*pg)+phasemod,
		(((a1*2)+(a2*3)+a3)/6)+ampmod);
	sin[22] = SinOsc.ar(((f1*2)+(f2*5)+(f3*4)+f4)+freqmod,
		((((p1*2)+(p2*5)+(p3*4)+p4)/12)*pg)+phasemod,
		(((a1*2)+(a2*5)+(a3*4)+a4)/12)+ampmod);
	sin[23] = SinOsc.ar(((f1*2)+(f2*7)+(f3*9)+(f4*5)+f5)+freqmod,
		((((p1*2)+(p2*7)+(p3*9)+(p4*5)+p5)/24)*pg)+phasemod,
		(((a1*2)+(a2*7)+(a3*9)+(a4*5)+a5)/24)+ampmod);

	out[7] = (sin[20]+sin[21]+sin[22]+sin[23])/4;

	//sinistra seconda serie
	sin[24] = SinOsc.ar(((f1*4)+(f2*4)+f3)+freqmod,
		((((p1*4)+(p2*4)+p3)/9)*pg)+phasemod,
		(((a1*4)+(a2*4)+a3)/9)+ampmod);
	sin[25] = SinOsc.ar(((f1*4)+(f2*8)+(f3*5)+f4)+freqmod,
		((((p1*4)+(p2*8)+(p3*5)+p4)/18)*pg)+phasemod,
		(((a1*4)+(a2*8)+(a3*5)+a4)/18)+ampmod);
	sin[26] = SinOsc.ar(((f1*4)+(f2*12)+(f3*13)+(f4*6)+f5)+freqmod,
		((((p1*4)+(p2*12)+(p3*13)+(p4*6)+p5)/36)*pg)+phasemod,
		(((a1*4)+(a2*12)+(a3*13)+(a4*6)+a5)/36)+ampmod);

	out[8] = (sin[24]+sin[25]+sin[26])/3;

	//sinistra terza serie
	sin[27] = SinOsc.ar(((f1*8)+(f2*12)+(f3*6)+f4)+freqmod,
		((((p1*8)+(p2*12)+(p3*6)+p4)/27)*pg)+phasemod,
		(((a1*8)+(a2*12)+(a3*6)+a4)/27)+ampmod);
	sin[28] = SinOsc.ar(((f1*8)+(f2*20)+(f3*18)+(f4*7)+f5)+freqmod,
		((((p1*8)+(p2*20)+(p3*18)+(p4*7)+p5)/54)*pg)+phasemod,
		(((a1*8)+(a2*20)+(a3*18)+(a4*7)+a5)/54)+ampmod);

	out[9] = (sin[27]+sin[28])/2;

	//sinistra quarta serie
	sin[29] = SinOsc.ar(((f1*16)+(f2*32)+(f3*24)+(f4*8)+f5)+freqmod,
		((((p1*16)+(p2*32)+(p3*24)+(p4*8)+p5)/81)*pg)+phasemod,
		(((a1*16)+(a2*32)+(a3*24)+(a4*8)+a5)/81)+ampmod);

	out[10] = sin[29];

master2 = master2*0.01;

	Out.ar(out1,out[6]*master2);
	Out.ar(out2,out[7]*master2);
	Out.ar(out3,out[8]*master2);
	Out.ar(out4,out[9]*master2);
	Out.ar(out5,out[10]*master2);

}).add;







// III SYNTH

m = SynthDef(\vec_tin3, {

	arg master2,f1,f2,f3,f4,f5,a1,a2,a3,a4,a5,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5,fmod,amod,pmod,min,max,trig,on_off,minamp,maxamp,minphase,maxphase,trigamp,trigphase;

	var sin = Array.fill(50), outs, out = Array.fill(20), pg = 1*pi,
	freqmod,ampmod,phasemod,frand,arand,prand;

	//trig freq
	trig = Dust.kr(trig);
	frand = TGaussRand.kr(min,max,trig);
	frand = frand*on_off;
	f1=f1+frand;
	f2=f2+frand;
	f3=f3+frand;
	f4=f4+frand;
	f5=f5+frand;

	//trig amp
	trigamp = Dust.kr(trigamp);
	arand = TGaussRand.kr(minamp,maxamp,trigamp);
	arand = arand*on_off;
	a1=a1+arand;
	a2=a2+arand;
	a3=a3+arand;
	a4=a4+arand;
	a5=a5+arand;

	//trig phase
	trigphase = Dust.kr(trigphase);
	prand = TGaussRand.kr(minphase,maxphase,trigphase);
	prand = prand*on_off;
	p1=p1+prand;
	p2=p2+prand;
	p3=p3+prand;
	p4=p4+prand;
	p5=p5+prand;

	//modulaizoni
	freqmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*fmod,0,(f1+f2+f3+f4+f5));
	ampmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*amod,0,(f1+f2+f3+f4+f5));
	phasemod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*pmod,0,(f1+f2+f3+f4+f5));
	phasemod = phasemod*1pi;



	//fond destra
	sin[30] = SinOsc.ar(f5+freqmod,
		(((p5)/1)*pg)+phasemod,
		((a5)/1)+ampmod);
	sin[31] = SinOsc.ar((f5+f4)+freqmod,
		(((p5+p4)/2)*pg)+phasemod,
		((a5+a4)/2)+ampmod);
	sin[32] = SinOsc.ar((f5+(f4*2)+f3)+freqmod,
		(((p5+(p4*2)+p3)/4)*pg)+phasemod,
		((a5+(a4*2)+a3)/4)+ampmod);
	sin[33] = SinOsc.ar((f5+(f4*3)+(f3*3)+f2)+freqmod,
		(((p5+(p4*3)+(p3*3)+p2)/8)*pg)+phasemod,
		((a5+(a4*3)+(a3*3)+a2)/8)+ampmod);
	sin[34] = SinOsc.ar((f5+(f4*4)+(f3*6)+(f2*4)+f1)+freqmod,
		(((p5+(p4*4)+(p3*6)+(p2*4)+p1)/16)*pg)+phasemod,
		((a5+(a4*4)+(a3*6)+(a2*4)+a1)/16)+ampmod);

	out[12] = (sin[30]+sin[31]+sin[32]+sin[33]+sin[34])/5;

	//destra prima serie
	sin[35] = SinOsc.ar(((f5*2)+f4)+freqmod,
		((((p5*2)+p4)/3)*pg)+phasemod,
		(((a5*2)+a4)/3)+ampmod);
	sin[36] = SinOsc.ar(((f5*2)+(f4*3)+f3)+freqmod,
		((((p5*2)+(p4*3)+p3)/6)*pg)+phasemod,
		(((a5*2)+(a4*3)+a3)/6)+ampmod);
	sin[37] = SinOsc.ar(((f5*2)+(f4*5)+(f3*4)+f2)+freqmod,
		((((p5*2)+(p4*5)+(p3*4)+p2)/12)*pg)+phasemod,
		(((a5*2)+(a4*5)+(a3*4)+a2)/12)+ampmod);
	sin[38] = SinOsc.ar(((f5*2)+(f4*7)+(f3*9)+(f2*5)+f1)+freqmod,
		((((p5*2)+(p4*7)+(p3*9)+(p2*5)+p1)/24)*pg)+phasemod,
		(((a5*2)+(a4*7)+(a3*9)+(a2*5)+a1)/24)+ampmod);

	out[13] = (sin[35]+sin[36]+sin[37]+sin[38])/4;

	//destra seconda serie
	sin[39] = SinOsc.ar(((f5*4)+(f4*4)+f3)+freqmod,
		((((p5*4)+(p4*4)+p3)/9)*pg)+phasemod,
		(((a5*4)+(a4*4)+a3)/9)+ampmod);
	sin[40] = SinOsc.ar(((f5*4)+(f4*8)+(f3*5)+f2)+freqmod,
		((((p5*4)+(p4*8)+(p3*5)+p2)/18)*pg)+phasemod,
		(((a5*4)+(a4*8)+(a3*5)+a2)/18)+ampmod);
	sin[41] = SinOsc.ar(((f5*4)+(f4*12)+(f3*13)+(f2*6)+f1)+freqmod,
		((((p5*4)+(p4*12)+(p3*13)+(p2*6)+p1)/36)*pg)+phasemod,
		(((a5*4)+(a4*12)+(a3*13)+(a2*6)+a1)/36)+ampmod);

	out[14] = (sin[39]+sin[40]+sin[41])/3;

	//destra terza serie
	sin[42] = SinOsc.ar(((f5*8)+(f4*12)+(f3*6)+f2)+freqmod,
		((((p5*8)+(p4*12)+(p3*6)+p2)/27)*pg)+phasemod,
		(((a5*8)+(a4*12)+(a3*6)+a2)/27)+ampmod);
	sin[43] = SinOsc.ar(((f5*8)+(f4*20)+(f3*18)+(f2*7)+f1)+freqmod,
		((((p5*8)+(p4*20)+(p3*18)+(p2*7)+p1)/54)*pg)+phasemod,
		(((a5*8)+(a4*20)+(a3*18)+(a2*7)+a1)/54)+ampmod);

	out[15] = (sin[42]+sin[43])/2;

	//destra quarta serie
	sin[44] = SinOsc.ar(((f5*16)+(f4*32)+(f3*24)+(f2*8)+f1)+freqmod,
		((((p5*16)+(p4*32)+(p3*24)+(p2*8)+p1)/81)*pg)+phasemod,
		(((a5*16)+(a4*32)+(a3*24)+(a2*8)+a1)/81)+ampmod);

	out[16] = sin[44];

master2 = master2*0.01;

	Out.ar(out1,out[12]*master2);
	Out.ar(out2,out[13]*master2);
	Out.ar(out3,out[14]*master2);
	Out.ar(out4,out[15]*master2);
	Out.ar(out5,out[16]*master2);

}).add;




//IV SYNTH

q = SynthDef(\vec_tin4, {

	arg master2,f1,f2,f3,f4,f5,a1,a2,a3,a4,a5,p1,p2,p3,p4,p5,out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,fmod,amod,pmod,min,max,trig,on_off,minamp,maxamp,minphase,maxphase,trigamp,trigphase;

	var sin = Array.fill(50), outs, out = Array.fill(20), pg = 1*pi,
	freqmod,ampmod,phasemod,frand,arand,prand;


	//trig freq
	trig = Dust.kr(trig);
	frand = TGaussRand.kr(min,max,trig);
	frand = frand*on_off;
	f1=f1+frand;
	f2=f2+frand;
	f3=f3+frand;
	f4=f4+frand;
	f5=f5+frand;

	//trig amp
	trigamp = Dust.kr(trigamp);
	arand = TGaussRand.kr(minamp,maxamp,trigamp);
	arand = arand*on_off;
	a1=a1+arand;
	a2=a2+arand;
	a3=a3+arand;
	a4=a4+arand;
	a5=a5+arand;

	//trig phase
	trigphase = Dust.kr(trigphase);
	prand = TGaussRand.kr(minphase,maxphase,trigphase);
	prand = prand*on_off;
	p1=p1+prand;
	p2=p2+prand;
	p3=p3+prand;
	p4=p4+prand;
	p5=p5+prand;

	//modulaizoni
	freqmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*fmod,0,(f1+f2+f3+f4+f5));
	ampmod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*amod,0,(f1+f2+f3+f4+f5));
	phasemod = SinOsc.kr(((f1+f2+f3+f4+f5)/5)*pmod,0,(f1+f2+f3+f4+f5));
	phasemod = phasemod*1pi;

	//fond final
	sin[45] = SinOsc.ar(((f1*31)+(f2*75)+(f3*70)+(f4*30)+(f5*5))+freqmod,
		((((p1*31)+(p2*75)+(p3*70)+(p4*30)+(p5*5))/211)*pg)+phasemod,
		(((a1*31)+(a2*75)+(a3*70)+(a4*30)+(a5*5))/211)+ampmod);
	sin[46] = SinOsc.ar(((f1*16)+(f2*48)+(f3*55)+(f4*29)+(f5*6))+freqmod,
		((((p1*16)+(p2*48)+(p3*55)+(p4*29)+(p5*6))/154)*pg)+phasemod,
		(((a1*16)+(a2*48)+(a3*55)+(a4*29)+(a5*6))/154)+ampmod);
	sin[47] = SinOsc.ar(((f1*7)+(f2*12)+(f3*50)+(f4*34)+(f5*9))+freqmod,
		((((p1*7)+(p2*12)+(p3*50)+(p4*34)+(p5*9))/112)*pg)+phasemod,
		(((a1*7)+(a2*12)+(a3*50)+(a4*34)+(a5*9))/112)+ampmod);
	sin[48] = SinOsc.ar(((f1*6)+(f2*29)+(f3*55)+(f4*48)+(f5*16))+freqmod,
		((((p1*6)+(p2*29)+(p3*55)+(p4*48)+(p5*16)/154))*pg)+phasemod,
		(((a1*6)+(a2*29)+(a3*55)+(a4*48)+(a5*16)/154))+ampmod);
	sin[49] = SinOsc.ar(((f1*5)+(f2*30)+(f3*70)+(f4*75)+(f5*31))+freqmod,
		((((p1*5)+(p2*30)+(p3*70)+(p4*75)+(p5*31))/211)*pg)+phasemod,
		(((a1*5)+(a2*30)+(a3*70)+(a4*75)+(a5*31))/211)+ampmod);

	//fond final
	sin[1] = SinOsc.ar((((f1*31)+(f2*75)+(f3*70)+(f4*30)+(f5*5))*2)+freqmod,
		((((p1*31)+(p2*75)+(p3*70)+(p4*30)+(p5*5))/211)*pg)+phasemod,
		(((a1*31)+(a2*75)+(a3*70)+(a4*30)+(a5*5))/211)+ampmod);
	sin[2] = SinOsc.ar((((f1*16)+(f2*48)+(f3*55)+(f4*29)+(f5*6))*2)+freqmod,
		((((p1*16)+(p2*48)+(p3*55)+(p4*29)+(p5*6))/154)*pg)+phasemod,
		(((a1*16)+(a2*48)+(a3*55)+(a4*29)+(a5*6))/154)+ampmod);
	sin[3] = SinOsc.ar((((f1*7)+(f2*12)+(f3*50)+(f4*34)+(f5*9))*2)+freqmod,
		((((p1*7)+(p2*12)+(p3*50)+(p4*34)+(p5*9))/112)*pg)+phasemod,
		(((a1*7)+(a2*12)+(a3*50)+(a4*34)+(a5*9))/112)+ampmod);
	sin[4] = SinOsc.ar((((f1*6)+(f2*29)+(f3*55)+(f4*48)+(f5*16))*2)+freqmod,
		((((p1*6)+(p2*29)+(p3*55)+(p4*48)+(p5*16)/154))*pg)+phasemod,
		((a1*6)+(a2*29)+(a3*55)+(a4*48)+(a5*16)/154)+ampmod);
	sin[5] = SinOsc.ar((((f1*5)+(f2*30)+(f3*70)+(f4*75)+(f5*31))*2)+freqmod,
		((((p1*5)+(p2*30)+(p3*70)+(p4*75)+(p5*31))/211)*pg)+phasemod,
		(((a1*5)+(a2*30)+(a3*70)+(a4*75)+(a5*31))/211)+ampmod);

	out[0] = sin[45];
	out[1] = sin[46];
	out[2] = sin[47];
	out[3] = sin[48];
	out[4] = sin[49];
	out[5] = sin[1];
	out[6] = sin[2];
	out[7] = sin[3];
	out[8] = sin[4];
	out[9] = sin[5];

	master2 = master2*0.01;

	Out.ar(out1,out[0]*master2);
	Out.ar(out2,out[1]*master2);
	Out.ar(out3,out[2]*master2);
	Out.ar(out4,out[3]*master2);
	Out.ar(out5,out[4]*master2);
	Out.ar(out6,out[5]*master2);
	Out.ar(out7,out[6]*master2);
	Out.ar(out8,out[7]*master2);
	Out.ar(out9,out[8]*master2);
	Out.ar(out10,out[9]*master2);

}).add;


)

//sonif pro
a = Synth.new(\S, [\out1, b.index,\out2, b.index+1,\out3, b.index+2,\out4, b.index+3,\out5, b.index+4]) ;

g = Synth.new(\P, [\out1, b.index+5,\out2, b.index+6,\out3, b.index+7,\out4, b.index+8,\out5, b.index+9,\out6, b.index+10,\out7, b.index+11,\out8, b.index+12,\out9, b.index+13,\out10, b.index+14]) ;

h = Synth.new(\D, [\out1, b.index+15,\out2, b.index+16,\out3, b.index+17,\out4, b.index+18,\out5, b.index+19,\out6, b.index+20,\out7, b.index+21,\out8, b.index+22,\out9, b.index+23,\out10, b.index+24]) ;




//sonif num
i = Synth.new(\vec_tin1, [\out1, b.index,\out2, b.index+1,\out3, b.index+2,\out4, b.index+3,\out5, b.index+4]) ;

l = Synth.new(\vec_tin2, [\out1, b.index+5,\out2, b.index+6,\out3, b.index+7,\out4, b.index+8,\out5, b.index+9]) ;

m = Synth.new(\vec_tin3, [\out1, b.index+10,\out2, b.index+11,\out3, b.index+12,\out4, b.index+13,\out5, b.index+14]);

q = Synth.new(\vec_tin4, [\out1, b.index+15,\out2, b.index+16,\out3, b.index+17,\out4, b.index+18,\out5, b.index+19,\out6, b.index+20,\out7, b.index+21,\out8, b.index+22,\out9, b.index+23,\out10, b.index+24]);




