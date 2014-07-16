clear all

output = cell(2,10);


for m_cnt = 1:10
    for t_cnt = 1:3
        try
        output{t_cnt,m_cnt} = addtestrun(t_cnt,m_cnt,'1.0');
%        plot(t, 'Color', colorOrder(mod(length(get(gca, 'Children')), size(colorOrder, 1))+1, :))
        
        end
    end
end

b1_1 = [output{1,6}{4,5} output{1,7}{4,5} output{1,10}{4,5}];
count_1 = [output{1,6}{5,5} output{1,7}{5,5} output{1,10}{5,5}];
s1_1 = [output{1,6}{6,5} output{1,7}{6,5} output{1,10}{6,5}];
h1_1 = [output{1,6}{7,5} output{1,7}{7,5} output{1,10}{7,5}];
c1_1 = [output{1,6}{9,5} output{1,7}{9,5} output{1,10}{9,5}];
r1_1 = [output{1,6}{10,5} output{1,7}{10,5} output{1,10}{10,5}];

m = [6 7 10];
bar([m;m;m;m;m;m]',[b1_1; count_1;s1_1 ;h1_1 ;c1_1; r1_1]','stacked')





%bar(6,output{1,6}{4,5},6,output{1,6}{5,5},6,output{1,6}{6,5},6,output{1,6}{7,5},6,output{1,6}{9,5},6,output{1,6}{10,5},'stacked')
%hold on
%bar(7,output{1,7}{4,5},7,output{1,7}{5,5},7,output{1,7}{6,5},7,output{1,7}{7,5},7,output{1,7}{9,5},7,output{1,7}{10,5},'stacked')
%%
i = 1;

for m_cnt = 6:10
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





if mod(length(power),2)==1 
    power = [power(1:2:end); power(2:2:end) 0];
    m = [m(1:2:end); m(2:2:end) 0];
else
    power = [power(1:2:end); power(2:2:end)];
    m = [m(1:2:end); m(2:2:end)];
end


n = 2.^m-1;
t(1,1:length(m)) = 1;
t(2,1:length(m)) = 2;

k = n-m.*t;

freq = 1e9;

bits_per_sec = k./n*freq;

joule_sec = power;
figure
plot(m',joule_sec'./bits_per_sec')