using Primes

function main()
    base::BigInt = 2  # Number base
    n::BigInt = 0   # The number that we will concatenate
    p::BigInt = 0   # Number with all previous numbers concatenated
    digit::BigInt = base   # How much we must multiply or 'p' to properly concatenate with 'n'
    counter::BigInt = base-1 # Hard to explain what this counters exactly do and why, but consider the following:
    # If p = 123 we must multiply 'p' by 10 to sum n = 4 and get p = 1234.
    # If p = 123...99 we must multiply 'p' by 100 to sum n = 100 and get p = 123...99100.
    # This counter is used to control the amount that 'p' is multiplied by.
    found::Bool = false
    for base in 2:10 # Change here the maximum base to search. Be careful.
        n = 0
        p = 0
        digit = base
        counter = base-1
        found = false
        for n in 1:1000 # Change here the maximum 'n' to search. Be careful, seriously.
            p *= digit
            p += n
            if isprime(p)
                println("Base $base: $p")
                found = true
            end
            counter -= 1
            if counter == 0 # Hard to explain why, but trust me: this works
                counter = digit*base - digit
                digit *= base
            end
        end
        if !found
            println("$base: Not found")
        end
    end
end

@time main()