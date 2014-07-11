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


power = [power(1:2:end); power(2:2:end)];
m = [m(1:2:end); m(2:2:end)];

n = 2.^m-1;
t(1,1:length(m)) = 1;
t(2,1:length(m)) = 2;

k = n-m.*t;

freq = 1e9;

bits_per_sec = k./n*freq;

joule_sec = power;

plot(m',joule_sec'./bits_per_sec')