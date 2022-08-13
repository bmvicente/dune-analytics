with txs as (select block_time, value, price
from ethereum."transactions" e
join prices."layer1_usd" p
on p.minute = date_trunc('minute', e.block_time)
and ("from"='\x1Db3439a222C519ab44bb1144fC28167b4Fa6EE6'
     or "from"='\xAb5801a7D398351b8bE11C439e05C5B3259aeC9B')
and p.symbol = 'ETH'
)
select date_trunc('month', block_time) as "Date", sum(value * price / 1e18) as "Value" 
from txs
group by 1 order by 1 DESC