//-----------------FIRST-ORDER-AMBISONIC----------------//
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


(
s =SynthDef(\orbital_S, {arg sig1,sig2,sig3,sig4,sig5,
	sl1,sl2,sl3,sl4,sl5,sl_mix,sl_total,
	temp_total,temp1s,temp2s,temp3s,temp4s,temp5s,
	rev,room,damp,diff;
	var sig_mix,mix,
	reve,out;                // audio signal.
	var
	gauss = Array.fill(5),
	angle = Array.fill(5),
	azim = Array.fill(5),
	elevation = Array.fill(5);           // angle and azimuth control



	// display encoder and decoder
	"Ambisonic encoding via % encoder".format(~encoder.kind).postln;
	"Ambisonic decoding via % decoder".format(~decoder.kind).postln;


	sig1 = In.ar(sig1,1);
	sig2 = In.ar(sig2,1);
	sig3 = In.ar(sig3,1);
	sig4 = In.ar(sig4,1);
	sig5 = In.ar(sig5,1);


	sig1 =GrainIn.ar(1,Dust.kr(1),sl1,sig1);
	sig2 =GrainIn.ar(1,Dust.kr(1),sl2,sig2);
	sig3 =GrainIn.ar(1,Dust.kr(1),sl3,sig3);
	sig4 =GrainIn.ar(1,Dust.kr(1),sl4,sig4);
	sig5 =GrainIn.ar(1,Dust.kr(1),sl5,sig5);


	//ORBITALS  S


	//1S

	gauss[0] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[0] = z.value(0,0.3,((SinOsc.kr((temp1s*temp_total),0,gauss[0],1))/2));
	azim[0] =  SinOsc.kr((temp1s*temp_total),0,gauss[0]);
	elevation[0] = SinOsc.kr((temp1s*temp_total),0,gauss[0]);
	//encode
	sig1 = FoaEncode.ar(sig1, ~encoder);
	//distance
	sig1 = FoaDirectO.ar(sig1,angle[0]*1pi);
	//azimut - elevation
	sig1 = FoaTransform.ar(sig1, 'push', pi/2, azim[0]*2pi,elevation[0]*2pi);

	//2S

	gauss[1] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[1] = z.value(0.3,0.6,((SinOsc.kr((temp2s*temp_total),0,gauss[1],1))/2));
	azim[1] =  SinOsc.kr((temp2s*temp_total),0,gauss[1]);
	elevation[1] = SinOsc.kr((temp2s*temp_total),0,gauss[1]);
	//encode
	sig2 = FoaEncode.ar(sig2, ~encoder);
	//distance
	sig2 = FoaDirectO.ar(sig2,angle[1]*1pi);
	//azimut - elevation
	sig2 = FoaTransform.ar(sig2, 'push', pi/2, azim[1]*2pi,elevation[1]*2pi);

	//3S

	gauss[2] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[2] = z.value(0.6,0.9,((SinOsc.kr((temp3s*temp_total),0,gauss[2],1))/2));
	azim[2] =  SinOsc.kr((temp3s*temp_total),0,gauss[2]);
	elevation[2] = SinOsc.kr((temp3s*temp_total),0,gauss[2]);

	//encode
	sig3 = FoaEncode.ar(sig3, ~encoder);
	//distance
	sig3 = FoaDirectO.ar(sig3,angle[2]*1pi);
	//azimut - elevation
	sig3 = FoaTransform.ar(sig3, 'push', pi/2, azim[2]*2pi,elevation[2]*2pi);

	//4S

	gauss[3] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[3] = z.value(0.9,1.2,((SinOsc.kr((temp4s*temp_total),0,gauss[3],1))/2));
	azim[3] =  SinOsc.kr((temp4s*temp_total),0,gauss[3]);
	elevation[3] = SinOsc.kr((temp4s*temp_total),0,gauss[3]);
	//encode
	sig4 = FoaEncode.ar(sig4, ~encoder);
	//distance
	sig4 = FoaDirectO.ar(sig4,angle[3]*1pi);
	//azimut - elevation
	sig4 = FoaTransform.ar(sig4, 'push', pi/2, azim[3]*2pi,elevation[3]*2pi);

	//5S


	gauss[4] = TGaussRand.kr(0,1,Dust.kr(1));

	angle[4] = z.value(1.2,1.5,((SinOsc.kr((temp5s*temp_total),0,gauss[4],1))/2));
	azim[4] =  SinOsc.kr((temp5s*temp_total),0,gauss[4]);
	elevation[4] = SinOsc.kr((temp5s*temp_total),0,gauss[4]);
	//encode
	sig5 = FoaEncode.ar(sig5, ~encoder);
	//distance
	sig5 = FoaDirectO.ar(sig5,angle[4]*1pi);
	//azimut - elevation
	sig5 = FoaTransform.ar(sig5, 'push', pi/2, azim[4]*2pi,elevation[4]*2pi);


	sig_mix = (sig1+sig2+sig3+sig4+sig5)/5;

	sig_mix = sig_mix*sl_mix;

	reve = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix = 1, room, damp, diff);
	reve = reve*rev;

	out = sig_mix+reve;
	// decode (to cube)
	//   out = FoaDecode.ar(sig_mix+rev, ~decoder);
	Out.ar(0,out*sl_total);

}).add;






//ORBITALE P
p =SynthDef(\orbital_P1, {arg sig1,sig2,sig3,sig4,sig5,
	sl1,sl2,sl3,sl4,sl5,sl_mix,sl_total,
	temp_total,temp2p,temp3p,
	rev,room,damp,diff;
	var sig_mix,mix,
	reve,out;
	var

	gauss = Array.fill(20),
	angle = Array.fill(10),
	azim = Array.fill(10),
	elevation = Array.fill(10);



	// display encoder and decoder
	"Ambisonic encoding via % encoder".format(~encoder.kind).postln;
	"Ambisonic decoding via % decoder".format(~decoder.kind).postln;



	sig1 = In.ar(sig1,1);
	sig2 = In.ar(sig2,1);
	sig3 = In.ar(sig3,1);
	sig4 = In.ar(sig4,1);
	sig5 = In.ar(sig5,1);


	sig1 =GrainIn.ar(1,Dust.kr(1),sl1,sig1);
	sig2 =GrainIn.ar(1,Dust.kr(1),sl2,sig2);
	sig3 =GrainIn.ar(1,Dust.kr(1),sl3,sig3);
	sig4 =GrainIn.ar(1,Dust.kr(1),sl4,sig4);
	sig5 =GrainIn.ar(1,Dust.kr(1),sl5,sig5);




	//ORBITALS  P
	//2Px
	gauss[0] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[0] = z.value(0,0.375,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1))/2);

	azim[0] = if(
		TIRand.kr(0,1,Dust.kr(1)),
		(z.value(0.375pi,0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2)));
		,
		(z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2)));
	);

	elevation[0] = if(
		TIRand.kr(0,1,Dust.kr(1)),
		(z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2)));
		,
		(z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[0],1)/2)));
	);



	//encode
	sig1 = FoaEncode.ar(sig1, ~encoder);
	//distance
	sig1 = FoaDirectO.ar(sig1,angle[0]*1pi);
	//azimut - elevation
	sig1 = FoaTransform.ar(sig1, 'push', pi/2, azim[0],elevation[0]);





	//2Py
	gauss[1] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[1] = z.value(0,0.375,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1))/2);

	azim[1]	= if((TIRand.kr(0,1,Dust.kr(1))),

		z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
		,
		z.value(0.875pi,1.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
	);



	elevation[1] = if(TIRand.kr(0,1,Dust.kr(1)),

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
			,
			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[1],1)/2));
	);



	//encode
	sig2 = FoaEncode.ar(sig2, ~encoder);
	//distance
	sig2 = FoaDirectO.ar(sig2,angle[1]*1pi);
	//azimut - elevation
	sig2 = FoaTransform.ar(sig2, 'push', pi/2, azim[1],elevation[1]);




	//2Pz
	gauss[2] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[2] = z.value(0,0.375,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1))/2);

	azim[2] = if((TIRand.kr(0,1,Dust.kr(1))),
		(
			z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));

		),
		(
			z.value(-5pi,5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));

	););

	elevation[2] =	if((TIRand.kr(0,1,Dust.kr(1))),
		(

			 z.value(0.375pi,0.5pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));
		),
		(

			z.value(-0.5pi,-0.375pi,(SinOsc.kr((temp2p*temp_total),0,gauss[2],1)/2));
	););


	//encode
	sig3 = FoaEncode.ar(sig3, ~encoder);
	//distance
	sig3 = FoaDirectO.ar(sig3,angle[2]*1pi);
	//azimut - elevation
	sig3 = FoaTransform.ar(sig3, 'push', pi/2, azim[2],elevation[2]);





	//3Px
	gauss[3] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[3] = z.value(0.375,0.75,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1))/2);

	azim[3] = if((TIRand.kr(0,1,Dust.kr(1))),
		(
			z.value(0.375pi,0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));

		),
		(
			z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));

	););

	elevation[3] = if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));
		),
		(

			 z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[3],1)/2));
	););

	//encode
	sig4 = FoaEncode.ar(sig4, ~encoder);
	//distance
	sig4 = FoaDirectO.ar(sig4,angle[3]*1pi);
	//azimut - elevation
	sig4 = FoaTransform.ar(sig4, 'push', pi/2, azim[3],elevation[3]);


	//3Py
	gauss[4] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[4] = z.value(0.375,0.75,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1))/2);

	azim[4] = if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));

		),
		(
			z.value(0.875pi,1.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));

	););

	elevation[4] = if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));
		),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp2p*temp_total),0,gauss[4],1)/2));
	););



	//encode
    sig5 = FoaEncode.ar(sig5, ~encoder);
	//distance
	sig5 = FoaDirectO.ar(sig5,angle[4]*1pi);
	//azimut - elevation
	sig5 = FoaTransform.ar(sig5, 'push', pi/2, azim[4],elevation[4]);




	sig_mix = (sig1+sig2+sig3+sig4+sig5)/5;

	sig_mix = sig_mix*sl_mix;

	reve = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix = 1, room, damp, diff);
	reve = reve*rev;

	out = sig_mix+reve;
	// decode (to cube)
	//out = FoaDecode.ar(sig_mix+rev, ~decoder);
	Out.ar(0,out*sl_total);

}).add;



//ORBITALE P
r =SynthDef(\orbital_P2, {arg sig6,sig7,sig8,sig9,sig10,
	sl6,sl7,sl8,sl9,sl10,sl_mix,sl_total,
	temp3p,temp4p,temp5p,temp_total,
	rev,room,damp,diff;
	var sig_mix,mix,
	reve,out;
	var

	gauss = Array.fill(20),
	angle = Array.fill(10),
	azim = Array.fill(10),
	elevation = Array.fill(10);



	// display encoder and decoder
	"Ambisonic encoding via % encoder".format(~encoder.kind).postln;
	"Ambisonic decoding via % decoder".format(~decoder.kind).postln;


	sig6 = In.ar(sig6,1);
	sig7 = In.ar(sig7,1);
	sig8 = In.ar(sig8,1);
	sig9 = In.ar(sig9,1);
	sig10 = In.ar(sig10,1);

	sig6 =GrainIn.ar(1,Dust.kr(1),sl6,sig6);
	sig7 =GrainIn.ar(1,Dust.kr(1),sl7,sig7);
	sig8 =GrainIn.ar(1,Dust.kr(1),sl8,sig8);
	sig9 =GrainIn.ar(1,Dust.kr(1),sl9,sig9);
	sig10 =GrainIn.ar(1,Dust.kr(1),sl10,sig10);


	//3Pz
	gauss[5] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[5] = z.value(0.375,0.75,(SinOsc.kr((temp3p*temp_total),0,gauss[5],1))/2);

	azim[5] =	if((TIRand.kr(0,1,Dust.kr(1))),
		(
			z.value(-5pi,5pi,(SinOsc.kr((temp3p*temp_total),0,gauss[5],1)/2));

		),
		(
			z.value(-5pi,5pi,(SinOsc.kr((temp3p*temp_total),0,gauss[5],1)/2));

	););

	elevation[5] = if((TIRand.kr(0,1,Dust.kr(1))),
		(

			z.value(0.375pi,0.5pi,(SinOsc.kr((temp3p*temp_total),0,gauss[5],1)/2));
		),
		(

			z.value(-0.5pi,-0.375pi,(SinOsc.kr((temp3p*temp_total),0,gauss[5],1)/2));
	););

	//encode
	sig6 = FoaEncode.ar(sig6, ~encoder);
	//distance
	sig6 = FoaDirectO.ar(sig6,angle[5]*1pi);
	//azimut - elevation
	sig6 = FoaTransform.ar(sig6, 'push', pi/2, azim[5],elevation[5]);


	//4Px
	gauss[6] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[6] =  z.value(0.75,1.125,(SinOsc.kr((temp4p*temp_total),0,gauss[6],1))/2);

	azim[6]= if((TIRand.kr(0,1,Dust.kr(1)) == 1),
		(
			z.value(0.375pi,0.625pi,(SinOsc.kr((temp4p*temp_total),0,gauss[6],1)/2));

		),
		(
			z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp4p*temp_total),0,gauss[6],1)/2));

	););

	elevation[6]= if((TIRand.kr(0,1,Dust.kr(1))),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp4p*temp_total),0,gauss[6],1)/2));
		),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp4p*temp_total),0,gauss[6],1)/2));
	););

	//encode
	sig7 = FoaEncode.ar(sig7, ~encoder);
	//distance
	sig7 = FoaDirectO.ar(sig7,angle[6]*1pi);
	//azimut - elevation
   sig7 = FoaTransform.ar(sig7, 'push', pi/2, azim[6],elevation[6]);


	//4Py
	gauss[7] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[7] = z.value(0.75,1.125,(SinOsc.kr((temp4p*temp_total),0,gauss[7],1))/2);

	azim[7]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(
			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp4p*temp_total),0,gauss[7],1)/2));

		),
		(
			z.value(0.875pi,1.125pi,(SinOsc.kr((temp4p*temp_total),0,gauss[7],1)/2));

	););


	elevation[7]= 	if((TIRand.kr(0,1,Dust.kr(1))),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp4p*temp_total),0,gauss[7],1)/2));
		),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp4p*temp_total),0,gauss[7],1)/2));
	););

	//encode
	sig8 = FoaEncode.ar(sig8, ~encoder);
	//distance
	sig8 = FoaDirectO.ar(sig8,angle[7]*1pi);
	//azimut - elevation
	sig8 = FoaTransform.ar(sig8, 'push', pi/2, azim[7],elevation[7]);

	//4Pz
	gauss[8] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[8] = z.value(0.75,1.125,(SinOsc.kr((temp4p*temp_total),0,gauss[8],1))/2);

	azim[8]= if((TIRand.kr(0,1,Dust.kr(1))),
		(
			z.value(-5pi,5pi,(SinOsc.kr((temp4p*temp_total),0,gauss[8],1)/2));

		),
		(
			z.value(-5pi,5pi,(SinOsc.kr((temp4p*temp_total),0,gauss[8],1)/2));

	););

	elevation[8]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(

			z.value(0.375pi,0.5pi,(SinOsc.kr((temp4p*temp_total),0,gauss[8],1)/2));
		),
		(

			z.value(-0.5pi,-0.375pi,(SinOsc.kr((temp4p*temp_total),0,gauss[8],1)/2));
	););


	//encode
	sig9 = FoaEncode.ar(sig9, ~encoder);
	//distance
	sig9 = FoaDirectO.ar(sig9,angle[8]*1pi);
	//azimut - elevation
	sig9 = FoaTransform.ar(sig9, 'push', pi/2, azim[8],elevation[8]);

	//5Px
	gauss[9] = TGaussRand.kr(0,1,Dust.kr(1));
	angle[9] =  z.value(1.125,1.5,(SinOsc.kr((temp5p*temp_total),0,gauss[9],1))/2);

	azim[9]= if((TIRand.kr(0,1,Dust.kr(1))),
		(
			z.value(0.375pi,0.625pi,(SinOsc.kr((temp5p*temp_total),0,gauss[9],1)/2));

		),
		(
			z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp5p*temp_total),0,gauss[9],1)/2));

	););

	elevation[9]= if((TIRand.kr(0,1,Dust.kr(1))),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp5p*temp_total),0,gauss[9],1)/2));
		),
		(

			z.value(-0.125pi,0.125pi,(SinOsc.kr((temp5p*temp_total),0,gauss[9],1)/2));
	););


//encode
    sig10 = FoaEncode.ar(sig10, ~encoder);
//distance
	sig10 = FoaDirectO.ar(sig10,angle[9]*1pi);
//azimut - elevation
   sig10 = FoaTransform.ar(sig10, 'push', pi/2, azim[9],elevation[9]);

	sig_mix = (sig6+sig7+sig8+sig9+sig10)/10;

	sig_mix = sig_mix*sl_mix;


	reve = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix =1, room, damp, diff);
	reve = reve*rev;


	out = sig_mix+reve;
	// decode (to cube)
	//out = FoaDecode.ar(sig_mix+rev, ~decoder);
	Out.ar(0,out*sl_total);

}).add;





//ORBITALE D
d =SynthDef(\orbital_D1, {arg sig1,sig2,sig3,sig4,sig5,
	sl1,sl2,sl3,sl4,sl5,sl_mix,sl_total,
	temp3d,temp_total,
	rev,room,damp,diff;
	var sig_mix,mix,
	reve,out,randif=TIRand.kr(0,1,Dust.kr(1)),
	sin1,sin2,sin3,sin4,sin5;                // audio signal
    var
	gauss = Array.fill(20),
	angle = Array.fill(10),
	azim = Array.fill(10),
	elevation = Array.fill(10);           // angle and azimuth control



   // display encoder and decoder
    "Ambisonic encoding via % encoder".format(~encoder.kind).postln;
   "Ambisonic decoding via % decoder".format(~decoder.kind).postln;


	sig1 = In.ar(sig1,1);
	sig2 = In.ar(sig2,1);
	sig3 = In.ar(sig3,1);
	sig4 = In.ar(sig4,1);
	sig5 = In.ar(sig5,1);


	sig1 =GrainIn.ar(1,Dust.kr(1),sl1,sig1);
	sig2 =GrainIn.ar(1,Dust.kr(1),sl2,sig2);
	sig3 =GrainIn.ar(1,Dust.kr(1),sl3,sig3);
	sig4 =GrainIn.ar(1,Dust.kr(1),sl4,sig4);
	sig5 =GrainIn.ar(1,Dust.kr(1),sl5,sig5);

	//ORBITALS  D

	//3Dxy
	gauss[0] = TGaussRand.kr(0,1,Dust.kr(1));
	sin1 = (SinOsc.kr((temp3d*temp_total),0,gauss[0],1)/2);
	angle[0] =  z.value(0,0.75,sin1);


	azim[0]= 	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin1);

			),
			(
				z.value(0.625pi,0.875pi,sin1);

			))
		),
		(if (randif,
			(
				 z.value(-0.375pi,-0.125pi,sin1);

			),
			(
				 z.value(-0.875pi,-0.625pi,sin1);

			))

	););



	elevation[0]=  	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(

				z.value(-0.125pi,0.125pi,sin1);
			),
			(

				z.value(-0.125pi,0.125pi,sin1);
			))
		),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin1);
			),
			(
				z.value(-0.125pi,0.125pi,sin1);
			))

	););


	//encode
	sig1 = FoaEncode.ar(sig1, ~encoder);
	//distance
	sig1 = FoaDirectO.ar(sig1,angle[0]*1pi);
	//azimut - elevation
   sig1 = FoaTransform.ar(sig1, 'push', pi/2, azim[0],elevation[0]);

	//3Dxz

	gauss[1] = TGaussRand.kr(0,1,Dust.kr(1));
	sin2 = SinOsc.kr((temp3d*temp_total),0,gauss[1],1)/2;
	angle[1] =  z.value(0,0.75,sin2);

	azim[1]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.375pi,0.625pi,sin2);

			),
			(
				z.value(0.375pi,0.625pi,sin2);

			))
		),
		(if (randif,
			(
				z.value(-0.625pi,-0.375pi,sin2);

			),
			(
				z.value(-0.625pi,-0.375pi,sin2);

			))

	););

	elevation[0]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin2);
			),
			(
				z.value(-0.375pi,-0.125pi,sin2);
			))
		),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin2);
			),
			(
				z.value(-0.375pi,-0.125pi,sin2);
			))

	););

	//encode
	sig2 = FoaEncode.ar(sig2, ~encoder);
	//distance
	sig2 = FoaDirectO.ar(sig2,angle[1]*1pi);
	//azimut - elevation
	sig2 = FoaTransform.ar(sig2, 'push', pi/2, azim[1],elevation[1]);



	//3Dyz
	gauss[2] = TGaussRand.kr(0,1,Dust.kr(1));
	sin3 = (SinOsc.kr((temp3d*temp_total),0,gauss[2],1)/2);
	angle[2] =  z.value(0,0.75,sin3);

	azim[2]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin3);

			),
			(
				z.value(-0.125pi,0.125pi,sin3);

			))
		),
		(if (randif,
			(
				z.value(0.875pi,1.125pi,sin3);

			),
			(
				z.value(-0.625pi,-0.375pi,sin3);

			))

	););


	elevation[2]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin3);
			),
			(
				z.value(-0.375pi,-0.125pi,sin3);
			))
		),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin3);
			),
			(
				z.value(0.875pi,1.125pi,sin3);
			))

	););

	//encode
	sig3 = FoaEncode.ar(sig3, ~encoder);
	//distance
	sig3 = FoaDirectO.ar(sig3,angle[2]*1pi);
	//azimut - elevation
	sig3 = FoaTransform.ar(sig3, 'push', pi/2, azim[2],elevation[2]);

	//3Dx^2-y^2

	gauss[3] = TGaussRand.kr(0,1,Dust.kr(1));
	sin4 = (SinOsc.kr((temp3d*temp_total),0,gauss[3],1)/2);
	angle[3] =  z.value(0,0.75,sin4);

	azim[3]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.375pi,0.625pi,sin4);

			),
			(
				z.value(-0.375pi,-0.625pi,sin4);

			))
		),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin4);

			),
			(
				z.value(0.875pi,1.125pi,sin4);

			))

	););

	elevation[3]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin4);
			),
			(
				z.value(-0.125pi,0.125pi,sin4);
			))
		),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin4);
			),
			(
				z.value(-0.125pi,0.125pi,sin4);
			))

	););

	//encode
	sig4 = FoaEncode.ar(sig4, ~encoder);
	//distance
	sig4 = FoaDirectO.ar(sig4,angle[3]*1pi);
	//azimut - elevation
	sig4 = FoaTransform.ar(sig4, 'push', pi/2, azim[3],elevation[3]);




	//3Dz^2
	gauss[4] = TGaussRand.kr(0,1,Dust.kr(1));
	sin5 = SinOsc.kr((temp3d*temp_total),0,gauss[4],1)/2;

	angle[4]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0,0.75,sin5);

			),
			(
				z.value(0,0.75,sin5);

			))
		),
		(
			z.value(0.375,0.75,sin5);

		);
	);

		azim[4]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.375pi,0.625pi,sin5);

			),
			(
				z.value(-0.375pi,-0.625pi,sin5);

			))
		),
		(
			z.value(-5pi,5pi,sin5);

		);
	);

		elevation[4]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin5);
			),
			(
				z.value(-0.125pi,0.125pi,sin5);
			))
		),
		(
			z.value(-0.0625pi,0.0625pi,sin5);
		);
	);


	//encode
	sig5 = FoaEncode.ar(sig5, ~encoder);
	//distance
	sig5 = FoaDirectO.ar(sig5,angle[4]*1pi);
	//azimut - elevation
	sig5 = FoaTransform.ar(sig5, 'push', pi/2, azim[4],elevation[4]);


	sig_mix = (sig1+sig2+sig3+sig4+sig5)/5;

	sig_mix = sig_mix*sl_mix;

	reve = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix = 1, room, damp, diff);
	reve = reve*rev;

	out = sig_mix+reve;
	// decode (to cube)
	//   out = FoaDecode.ar(sig_mix, ~decoder);
	Out.ar(0,out*sl_total);

}).add;






//ORBITALE D
e =SynthDef(\orbital_D2, {arg sig1,sig2,sig3,sig4,sig5,
	sl1,sl2,sl3,sl4,sl5,sl_mix,sl_total,
	temp4d,temp_total,
	rev,room,damp,diff;
	var sig_mix,mix,
	reve,out,randif=TIRand.kr(0,1,Dust.kr(1)),
	sin1,sin2,sin3,sin4,sin5;                // audio signal
    var
	gauss = Array.fill(10),
	angle = Array.fill(10),
	azim = Array.fill(10),
	elevation = Array.fill(10);           // angle and azimuth control



   // display encoder and decoder
    "Ambisonic encoding via % encoder".format(~encoder.kind).postln;
   "Ambisonic decoding via % decoder".format(~decoder.kind).postln;


	sig1 = In.ar(sig1,1);
	sig2 = In.ar(sig2,1);
	sig3 = In.ar(sig3,1);
	sig4 = In.ar(sig4,1);
	sig5 = In.ar(sig5,1);


	sig1 =GrainIn.ar(1,Dust.kr(1),sl1,sig1);
	sig2 =GrainIn.ar(1,Dust.kr(1),sl2,sig2);
	sig3 =GrainIn.ar(1,Dust.kr(1),sl3,sig3);
	sig4 =GrainIn.ar(1,Dust.kr(1),sl4,sig4);
	sig5 =GrainIn.ar(1,Dust.kr(1),sl5,sig5);

	//ORBITALS  D




	//4Dxy
	gauss[0] = TGaussRand.kr(0,1,Dust.kr(1));
	sin1 =(SinOsc.kr((temp4d*temp_total),0,gauss[0],1)/2);

	angle[0] =  z.value(0.75,1.5,sin1);

	azim[0]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin1);

			),
			(
				z.value(0.625pi,0.875pi,sin1);

			))
		),
		(if (randif,
			(
				z.value(-0.375pi,-0.125pi,sin1);

			),
			(
				z.value(-0.875pi,-0.625pi,sin1);

			))

	););


	elevation[0]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin1);
			),
			(
				z.value(-0.125pi,0.125pi,sin1);
			))
		),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin1);
			),
			(
				z.value(-0.125pi,0.125pi,sin1);
			))

	););


	//encode
	sig1 = FoaEncode.ar(sig1, ~encoder);
	//distance
	sig1 = FoaDirectO.ar(sig1,angle[0]*1pi);
	//azimut - elevation
	sig1 = FoaTransform.ar(sig1, 'push', pi/2, azim[0],elevation[0]);



	//4Dxz

	gauss[1] = TGaussRand.kr(0,1,Dust.kr(1));
	sin2 = (SinOsc.kr((temp4d*temp_total),0,gauss[1],1)/2);

	angle[1] =  z.value(0.75,1.5,randif);

	azim[1]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.375pi,0.625pi,sin2);

			),
			(
				z.value(0.375pi,0.625pi,sin2);

			))
		),
		(if (randif,
			(
				z.value(-0.625pi,-0.375pi,sin2);

			),
			(
				z.value(-0.625pi,-0.375pi,sin2);

			))

	););

	elevation[1]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin2);
			),
			(
				z.value(-0.375pi,-0.125pi,sin2);
			))
		),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin2);
			),
			(
				z.value(-0.375pi,-0.125pi,sin2);
			))

	););



	//encode
	sig2 = FoaEncode.ar(sig2, ~encoder);
	//distance
	sig2 = FoaDirectO.ar(sig2,angle[1]*1pi);
	//azimut - elevation
	sig2 = FoaTransform.ar(sig2, 'push', pi/2, azim[1],elevation[1]);



	//4Dyz
	gauss[2] = TGaussRand.kr(0,1,Dust.kr(1));
	sin3 =(SinOsc.kr((temp4d*temp_total),0,gauss[2],1)/2);

	angle[2] =  z.value(0.75,1.5,sin3);

	azim[2]= 	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin3);

			),
			(
				 z.value(-0.125pi,0.125pi,sin3);

			))
		),
		(if (randif,
			(
				 z.value(0.875pi,1.125pi,sin3);

			),
			(
				z.value(-0.625pi,-0.375pi,sin3);

			))

	););

	elevation[2]=	if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin3);
			),
			(
				z.value(-0.375pi,-0.125pi,sin3);
			))
		),
		(if (randif,
			(
				z.value(0.125pi,0.375pi,sin3);
			),
			(
				z.value(0.875pi,1.125pi,sin3);
			))

	););

//encode
    sig3 = FoaEncode.ar(sig3, ~encoder);
//distance
	sig3 = FoaDirectO.ar(sig3,angle[2]*1pi);
//azimut - elevation
   sig3 = FoaTransform.ar(sig3, 'push', pi/2, azim[2],elevation[2]);

	//4Dx^2-y^2

	gauss[3] = TGaussRand.kr(0,1,Dust.kr(1));
	sin4 =(SinOsc.kr((temp4d*temp_total),0,gauss[3],1)/2);

	angle[3] =  z.value(0.75,1.5,sin4);

	azim[4]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.375pi,0.625pi,sin4);

			),
			(
				z.value(-0.375pi,-0.625pi,sin4);

			))
		),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin4);

			),
			(
				z.value(0.875pi,1.125pi,sin4);

			))


	););

		elevation[4]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin4);
			),
			(
				z.value(-0.125pi,0.125pi,sin4);
			))
		),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,sin4);
			),
			(
				z.value(-0.125pi,0.125pi,sin4);
			))

	););

	//encode
	sig4 = FoaEncode.ar(sig4, ~encoder);
	//distance
	sig4 = FoaDirectO.ar(sig4,angle[3]*1pi);
	//azimut - elevation
	sig4 = FoaTransform.ar(sig4, 'push', pi/2, azim[3],elevation[3]);




	//4Dz^2
	gauss[4] = TGaussRand.kr(0,1,Dust.kr(1));
	sin5 =SinOsc.kr((temp4d*temp_total),0,gauss[4],1)/2;


	angle[4] = if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.75,1.5,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1))/2);

			),
			(
				z.value(0.75,1.5,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1))/2);

			))
		),
		(
			z.value(0.75,1.25,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1))/2);

		);
	);


	azim[4] = if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(0.375pi,0.625pi,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1)/2));

			),
			(
				z.value(-0.375pi,-0.625pi,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1)/2));

			))
		),
		(
			z.value(-5pi,5pi,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1)/2));

		);
	);


	elevation[4]= if((TIRand.kr(0,1,Dust.kr(1))),
		(if (randif,
			(
				z.value(-0.125pi,0.125pi,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1)/2));
			),
			(
				z.value(-0.125pi,0.125pi,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1)/2));
			))
		),
		(
			z.value(-0.0625pi,0.0625pi,(SinOsc.kr((temp4d*temp_total),0,gauss[4],1)/2));
		);
	);



	//encode
	sig5 = FoaEncode.ar(sig5, ~encoder);
	//distance
	sig5 = FoaDirectO.ar(sig5,angle[4]*1pi);
	//azimut - elevation
	sig5 = FoaTransform.ar(sig5, 'push', pi/2, azim[4],elevation[4]);




	sig_mix = (sig1+sig2+sig3+sig4+sig5)/5;

	sig_mix = sig_mix*sl_mix;

	reve = BFFreeVerb.ar (sig_mix[0], sig_mix[1], sig_mix[2], sig_mix[3], mix =1, room, damp, diff);
	reve = reve*rev;

	out = sig_mix+reve;
	// decode (to cube)
//   out = FoaDecode.ar(sig_mix, ~decoder);
	Out.ar(0,out*sl_total);

}).add;


)

s = Synth(\orbital_S, [\sig1,b.index,\sig2,b.index+1,\sig3,b.index+2,\sig4,b.index+3,\sig5,b.index+4],1,\addToTail);s.run;

p = Synth(\orbital_P1, [\sig1,b.index+5,\sig2,b.index+6,\sig3,b.index+7,\sig4,b.index+8,\sig5,b.index+9],1,\addToTail);p.run;

r = Synth(\orbital_P2, [\sig6,b.index+10,\sig7,b.index+11,\sig8,b.index+12,\sig9,b.index+13,\sig10,b.index+14],1,\addToTail);r.run;

d = Synth(\orbital_D1, [\sig1,b.index+15,\sig2,b.index+16,\sig3,b.index+17,\sig4,b.index+18,\sig5,b.index+19],1,\addToTail);d.run;

e = Synth(\orbital_D2, [\sig1,b.index+20,\sig2,b.index+21,\sig3,b.index+22,\sig4,b.index+23,\sig5,b.index+24],1,\addToTail);e.run;
