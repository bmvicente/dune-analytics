with txs as (select block_time, value, price
from ethereum."transactions" e
join prices."layer1_usd" p
on p.minute = date_trunc('minute', e.block_time)
where block_time > now() - interval '10 days'
and symbol = 'ETH'
)
select date_trunc('day', block_time) as "Date", sum(value * price / 1e18) as "Value" 
from txs
group by 1 order by 1