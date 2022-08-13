with alltransactions as
(
SELECT 
    block_time, 
    success, 
    gas_price/10^9 as gas_price, 
    (gas_price * gas_used)/10^18 as eth_paid_in_tx, 
    hash
    
FROM ethereum.transactions
WHERE "from" = '\x24EB84F2C45eB0BDe32183662B417cbc8896E34f'
)

SELECT date_trunc('week', block_time) as week, count(*) as tx_per_week from alltransactions

GROUP BY 1