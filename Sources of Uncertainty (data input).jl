
# Sources of uncertainty

#--------------------------------------------

# Hourly wind power production in the next day (6 Scenarios in total)


wind_production_da = [
351.64	361.72	221.68	190.65	210.23	142.35;
336.1	353.24	218.04	188.75	206.06	138.79;
326.02	352.18	213.28	182.29	205.65	137.16;
318.4	358.86	214.16	184.09	213	    138.97;
323.08	357.48	215.65	192.91	213	    135.55;
317.54	358.4	214.07	190.09	212.98	135.08;
317.89	354.28	212.54	185.97	214	    134.61;
329.08	358.21	213.82	187.02	217.33	139.97;
336.24	360.16	220.11	191.27	218.25	144.63;
340.11	364.86	221.34	195.11	216.46	145.62;
351.72	369.7	230.09	204.4	214.86	144.4;
341.65	353.83	221.89	201.62	205.12	136.63;
344.81	340.86	212.38	195.66	197.28	131.91;
323.35	289.03	191.16	182.64	176.77	118.81;
284.54	186.24	135.93	157.67	133.77	96.68;
227.4	113.47	82.38	115.67	88.81	66.39;
171.36	95.76	54.08	84.41	69.38	47.12;
129.4	97.88	48.63	55.7	64.83	41.57;
99.62	106.84	51.01	48.01	78.37	43.65;
89.04	133.82	66.24	54.9	92.02	53.67;
91.19	146.39	84.95	74.61	95.18	62.78;
114.89	159.37	83.69	90.92	84.67	59.2;
146.03	165.08	77.75	83.92	68.9	43.65;
148.17	162.65	75.03	71.19	56.68	30.61

]

# Hourly day-ahead market prices in the next day (10 Scenarios in total)

price_da = [
78.68	96	    124	    120.79	77.06	68.05	55.12	9.57	105.42	107.48;
82.3	91.71	114.94	112.28	73.19	65.89	43.8	4.46	104.32	107.61;
84.67	87.48	113.06	111.56	73.39	55.29	40.67	4	    100.74	103.8;
92.83	83.99	110.18	108.65	69.03	45.94	40.18	1.95	104.17	100;
92.5	84.9	104.62	110	    66.67	33.17	35.07	3.64	104.62	98.07;
99.44	92.85	116.4	118.21	71.96	55.78	40.19	9.8	    108.07	103.86;
130.05	108.74	132.51	129.81	84.43	80.64	62.44	42.6	116.23	130.32;
159.92	139.56	148.43	145.49	89.61	87.06	81.23	90.42	140.4	142.35;
159.92	136.53	144.94	143.45	93.46	92.8	81.23	94.84	148.68	138.03;
125.21	97.85	134.26	128.53	82.37	72.8	62.36	83.37	111.63	117.12;
104.28	92.57	117.48	115	    58.35	40.74	36.95	73.78	103.27	103.2;
94.89	80.93	104.39	106.67	33.29	35.68	25.28	60.94	95.94	91.51;
93.59	68.26	99.68	101.91	22.93	35.64	11.47	53.26	90.85	85.4;
91.68	54.91	98.08	99.48	16.99	36.29	3.99	59.6	90.84	78.49;
91.76	42.74	98.01	96.09	39.43	41.62	2.07	65.45	93.41	80.48;
94.32	46.16	99.64	95.34	68.41	54	    5.84	59.82	94.5	84.89;
96.08	49.62	102.43	98.78	78.92	74.33	29.59	78.83	101.05	93.29;
108.59	74.37	132.82	103.31	85.46	87.01	79.16	99.91	111.3	97.75;
136.87	95.95	150.96	106.24	84.97	92.59	85.54	104.06	114.55	100.99;
160.98	124.38	165.47	97.37	88.78	96	    88.63	104.04	112.81	99.52;
161	    102.19	152.36	94.05	88.29	91.59	88.32	99.25	109.69	96;
132	    101.91	135.49	92.04	87.99	88.99	82.5	99.06	110.62	88.5;
125.01	103.52	127.5	90.01	88.84	86.1	76.2	99.07	111.91	86.07;
110.39	91.46	117.04	87.47	83.29	77.35	64.9	98.25	112.29	77.87
]

# Power system need (10 Scenarios in total)

using Random

n = 24  # 24 hours of the day
p = 0.5  # probability of success

# initialize an empty matrix to store the hourly need of the system

System_need_rand = zeros(Int, 0, n) 

# generate the matrix of 0s and 1s with a Bernoulli distribution

for i in 1:10

    v = rand(Bernoulli(p), n)
    
    System_need_rand = vcat(System_need, v')

    
end

# Every time the code generates a new matrix so we just save one output on the following one

# Ones is for system excess and zeros for system deficit

System_need = [ 
1  1  0  0  1  1  0  1  1  0  0  1  0  1  0  1  0  1  0  0  0  1  0  0;
1  1  1  1  0  1  0  1  0  1  0  1  0  0  0  0  0  1  1  1  1  1  0  0;
1  1  0  0  0  1  1  0  1  0  1  0  1  1  0  0  1  1  0  1  0  0  1  1;
1  0  0  0  1  0  1  1  1  0  0  0  1  1  0  1  1  1  1  1  0  0  0  0;
1  0  0  1  1  0  0  1  0  0  1  0  1  0  1  1  0  1  0  1  1  0  1  0;
1  0  0  1  0  0  1  1  0  1  0  0  0  0  0  1  1  0  1  0  0  1  1  0;
1  0  1  0  1  0  0  1  0  0  1  0  1  1  1  0  1  0  0  0  0  1  1  1;
0  1  1  0  0  0  1  0  0  0  1  0  0  1  1  1  0  1  0  1  0  0  1  0;
0  0  1  1  0  1  1  0  0  0  0  0  0  0  0  1  0  1  0  0  1  0  0  0;
0  0  0  1  1  1  1  0  1  0  1  0  1  0  0  1  0  1  0  0  0  0  1  1
]


