def my_reject(arr, &prc)
    arr.select { |ele| ele if !prc.call(ele) }
end

def my_one?(arr, &prc)
    count = arr.count { |ele| prc.call(ele) }
    count == 1
end

def hash_select(hash, &prc)
    new_h = Hash.new(0)
    hash.each { |k, v| new_h[k] = v if prc.call(k, v) }
    new_h
end

def xor_select(arr, prc1, prc2)
    arr.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)) }
end

def proc_count(val, procs)
    procs.count { |proc| proc.call(val) }
end