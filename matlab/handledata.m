clear all
close all
output = cell(2,10);


for m_cnt = 1:10
    for t_cnt = 1:3
        try
        output{t_cnt,m_cnt,1} = addtestrun(t_cnt,m_cnt,'1.0');
        output{t_cnt,m_cnt,2} = addtestrun(t_cnt,m_cnt,'1.500');
        output{t_cnt,m_cnt,3} = addtestrun(t_cnt,m_cnt,'2.0');
        output{t_cnt,m_cnt,4} = addtestrun(t_cnt,m_cnt,'2.500');
        output{t_cnt,m_cnt,5} = addtestrun(t_cnt,m_cnt,'3.0');
        output{t_cnt,m_cnt,6} = addtestrun(t_cnt,m_cnt,'3.500');
%        plot(t, 'Color', colorOrder(mod(length(get(gca, 'Children')), size(colorOrder, 1))+1, :))
        
        end
    end
end
%output2 = output;
load output_shift_buffer.mat
output

%b1_1 = [output2{1,6}{4,5} output2{1,7}{4,5} output2{1,10}{4,5}];
%count_1 = [output2{1,6}{5,5} output2{1,7}{5,5} output2{1,10}{5,5}];
%s1_1 = [output2{1,6}{6,5} output2{1,7}{6,5} output2{1,10}{6,5}];
%h1_1 = [output2{1,6}{7,5} output2{1,7}{7,5} output2{1,10}{7,5}];
%c1_1 = [output2{1,6}{9,5} output2{1,7}{9,5} output2{1,10}{9,5}];
%r1_1 = [output2{1,6}{10,5} output2{1,7}{10,5} output2{1,10}{10,5}];

b1_1 = [output{1,6}{4,5} output{1,7}{4,5} output{1,10}{4,5}];
count_1 = [output{1,6}{5,5} output{1,7}{5,5} output{1,10}{5,5}];
s1_1 = [output{1,6}{6,5} output{1,7}{6,5} output{1,10}{6,5}];
h1_1 = [output{1,6}{7,5} output{1,7}{7,5} output{1,10}{7,5}];
c1_1 = [output{1,6}{9,5} output{1,7}{9,5} output{1,10}{9,5}];
r1_1 = [output{1,6}{10,5} output{1,7}{10,5} output{1,10}{10,5}];



m = [6 7 10];
bar([m;m;m;m;m;m]',[b1_1; count_1;s1_1 ;h1_1 ;c1_1; r1_1]'*1e3,'stacked')
title('Power consumed by the components of the BCH encoder and decoder for t = 1')
xlabel('m')
ylabel('power [mw]')
legend('Location','NorthWest','Buffer','Decoder counter','Syndrome calculation','Chien search','Encoder counter','Encoder shift register')

figure

bar([m;m;m;m;m]',[count_1;s1_1 ;h1_1 ;c1_1; r1_1]'*1e3,'stacked')
title('Power consumed by the components of the BCH encoder and decoder for t = 1')
xlabel('m')
ylabel('power [mw]')
legend('Location','NorthWest','Decoder counter','Syndrome calculation','Chien search','Encoder counter','Encoder shift register')


%bar(6,output{1,6}{4,5},6,output{1,6}{5,5},6,output{1,6}{6,5},6,output{1,6}{7,5},6,output{1,6}{9,5},6,output{1,6}{10,5},'stacked')
%hold on
%bar(7,output{1,7}{4,5},7,output{1,7}{5,5},7,output{1,7}{6,5},7,output{1,7}{7,5},7,output{1,7}{9,5},7,output{1,7}{10,5},'stacked')
%%
i = 1;
m = [ ];
for m_cnt = 1:10
	for t_cnt = 1:2
		
        try
			for j = 1:length(output{t_cnt,m_cnt})
				is_dec = strfind('decoder',output{t_cnt,m_cnt}{j,1});
				is_enc = strfind('encoder',output{t_cnt,m_cnt}{j,1});

				if is_dec == 1 
					dec_row = j;
				end
	
				if is_enc == 1
					enc_row = j;
				end
			end
			power(i) = (output{t_cnt,m_cnt}{dec_row,end}+output{t_cnt,m_cnt}{enc_row,end});
			m(i) = m_cnt;
			i = i+1;
		end
	end
end

i = 1;
for m_cnt = 1:10
	for t_cnt = 1:2
		
        try
			for j = 1:length(output2{t_cnt,m_cnt})
				is_dec = strfind('decoder',output2{t_cnt,m_cnt}{j,1});
				is_enc = strfind('encoder',output2{t_cnt,m_cnt}{j,1});

				if is_dec == 1 
					dec_row = j;
				end
	
				if is_enc == 1
					enc_row = j;
				end
			end
			power2(i) = (output2{t_cnt,m_cnt}{dec_row,end}+output2{t_cnt,m_cnt}{enc_row,end});
			m2(i) = m_cnt;
			i = i+1;
		end
	end
end


if mod(length(power),2)==1 
    power = [power(1:2:end); power(2:2:end) 0];
    m = [m(1:2:end); m(2:2:end) 0];
else
    power = [power(1:2:end); power(2:2:end)];
    m = [m(1:2:end); m(2:2:end)];
end

if mod(length(power2),2)==1 
    power2 = [power2(1:2:end); power2(2:2:end) 0];
    m2 = [m2(1:2:end); m2(2:2:end) 0];
else
    power2 = [power2(1:2:end); power2(2:2:end)];
    m2 = [m2(1:2:end); m2(2:2:end)];
end


n = 2.^m-1;
t(1,1:length(m)) = 1;
t(2,1:length(m)) = 2;

k = n-m.*t;

freq = 1e9;

bits_per_sec = k./n*freq;

joule_sec = power*1e12;
joule_sec2 = power2*1e12;

%%
figure
plot(m2',power2'*1e3)
title('Power depending on chosen m and t');
xlabel('m');
ylabel('Power [mW]');
legend('Location','NorthWest','t=1','t=2');

%%
figure
plot(m',power'*1e3,'o-',m2',power2'*1e3,'o-')
title('Comparision of power consumption of different memory implementations at f = 1GHz');
xlabel('m');
ylabel('Power [mW]');

legend('Location','NorthWest','Circular buffer T=1','Circular buffer T=2','Shift buffer T=1','Shift buffer T=2');

figure
plot(m',joule_sec'./bits_per_sec');
title('Energy needed to transmit 1 bit of information');
xlabel('m');
ylabel('Energy/bit [pJ/bit]');

legend('Location','NorthWest','T=1','T=2');

%%
clear power
i = 1;
for run = 1:4
    for m_cnt = 6:6
        for t_cnt = 1:1
            
            try
                for j = 1:length(output{t_cnt,m_cnt,run})
                    is_dec = strfind('decoder',output{t_cnt,m_cnt,run}{j,1});
                    is_enc = strfind('encoder',output{t_cnt,m_cnt,run}{j,1});
                    
                    if is_dec == 1
                        dec_row = j;
                    end
                    
                    if is_enc == 1
                        enc_row = j;
                    end
                end
                power(i,1) = (output{t_cnt,m_cnt,run}{dec_row,end}+output{t_cnt,m_cnt,run}{enc_row,end});
                m(i) = m_cnt;
                i = i+1;
            end
        end
    end
end
i = 1;
for run = 1:4
    for m_cnt = 7:7
        for t_cnt = 1:1
            
            try
                for j = 1:length(output{t_cnt,m_cnt,run})
                    is_dec = strfind('decoder',output{t_cnt,m_cnt,run}{j,1});
                    is_enc = strfind('encoder',output{t_cnt,m_cnt,run}{j,1});
                    
                    if is_dec == 1
                        dec_row = j;
                    end
                    
                    if is_enc == 1
                        enc_row = j;
                    end
                end
                power(i,2) = (output{t_cnt,m_cnt,run}{dec_row,end}+output{t_cnt,m_cnt,run}{enc_row,end});
                m(i) = m_cnt;
                i = i+1;
            end
        end
    end
end

i = 1;
for run = 1:4
    for m_cnt = 10:10
        for t_cnt = 1:1
            
            try
                for j = 1:length(output{t_cnt,m_cnt,run})
                    is_dec = strfind('decoder',output{t_cnt,m_cnt,run}{j,1});
                    is_enc = strfind('encoder',output{t_cnt,m_cnt,run}{j,1});
                    
                    if is_dec == 1
                        dec_row = j;
                    end
                    
                    if is_enc == 1
                        enc_row = j;
                    end
                end
                power(i,3) = (output{t_cnt,m_cnt,run}{dec_row,end}+output{t_cnt,m_cnt,run}{enc_row,end});
                m(i) = m_cnt;
                i = i+1;
            end
        end
    end
end

%%
freq = [1e9 1.5e9 2e9 2.5e9];
%bits_per_sec = (k(1)./n(1)*freq);

figure
plot(freq',power(:,1)',freq([1 2 3])',power([1 2 3],2)',freq',power(:,3)')
title('Power consumption at different frequencies')
xlabel('Frequency [Hz]')
ylabel('Power [w]')
legend('Location','NorthWest','m=6','m=7','m=10');

figure
plot(freq',power(:,1)'./(k(1)./n(1)*freq))
title('Energy needed to transmit 1 bit of information')
xlabel('Frequency [Hz]')
ylabel('Joule per bit [J/bit]')
legend('m = 6')
%freq([1 2 3])',power([1 2 3],2)'./(k(2)./n(2)*freq([1 2 3])))
%plot(freq',power(:,3)'./(k(3)./n(3)*freq))
