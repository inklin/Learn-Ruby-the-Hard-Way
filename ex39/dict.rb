module Dict
  def Dict.new(num_buckets=256)
    # Initializes a Dict with the given number of buckets
    aDict = []
    # The loop below runs 256 times, the number goes from 0 to 255
    (0...num_buckets).each do |i|
      # push an empty array on to aDict
      aDict.push([])
    end

    # aDict is an array with 255 buckets (these buckets are empty arrays)
    return aDict
  end

  def Dict.hash_key(aDict, key)
    # Given a key, this will create a number and then convert it to 
    # an index for the aDict's buckets.
    return key.hash % aDict.length
    # key.hash returns a number, by getting the remainder of modulus 
    # aDict.length, we ensure it fits into our buckets
  end

  def Dict.get_bucket(aDict, key)
    # Given a key, find the bucket where it would go
    bucket_id = Dict.hash_key(aDict, key)
    # bucket_id is a number, indicating the bucket in aDict
    # return the bucket 
    return aDict[bucket_id]
  end

  def Dict.get_slot(aDict, key, default=nil)
    # Returns the index, key, and value of a slot found in a bucket.

    # get the bucket (remember the bucket is an array of key-value pairs)
    bucket = Dict.get_bucket(aDict, key)

    # go through each key-value in the bucket
    bucket.each_with_index do |kv, i|
      k, v = kv
      # if the key in the key-value pair matches the argument key, 
      # return the index, key, and value
      if key == k
        return i, k, v
      end
    end

    # if none of the keys in the bucket match,
    # return -1 for index, key, and nil for value
    return -1, key, default
  end

  def Dict.get(aDict, key, default=nil)
    
    # Gets the value in a bucket for the given key, or the default.
    i, k, v = Dict.get_slot(aDict, key, default=default)
    # returns value or nil
    return v
  end

  def Dict.set(aDict, key, value)
    # Sets the key to the value, replacing any existing value.
    bucket = Dict.get_bucket(aDict, key)
    i, k, v = Dict.get_slot(aDict, key)

    # if a value exists for the key, index will be >= 0
    # if a value does not exist for the key, index will be -1
    if i >= 0
      # if a value exists, we simply replace the existing value
      bucket[i] = [key, value]
    else
      # if a value does not exist for that key,
      # we push the key-value pair to the bucket array
      # each individual bucket entry looks like [key, value]
      bucket.push([key, value])
    end
  end

  def Dict.delete(aDict, key)
    # Deletes the given key from the Dict

    # first get the bucket (the array of key-value pairs)
    bucket = Dict.get_bucket(aDict, key)

    # go through each key-value pair in the array
    # note: index goes from 0 to bucket.length - 1
    # that's why the range is exclusive
    (0...bucket.length).each do |i|
      # get the key and value at the index ([key, value])
      k, v = bucket[i]
      # if the key is the one we want to delete
      if key == k
        # delete the key-value pair at that index
        bucket.delete_at(i)
        break
      end
    end
  end

  def Dict.list(aDict)
    # Prints out what's in the Dict

    # Go through the buckets in aDict
    aDict.each do |bucket|
      # if the bucket is not empty
      if bucket
        # go through each key-value pair in the bucket
        # and print it to the screen
        bucket.each { |k, v| puts k, v}
      end
    end
  end

  def Dict.dump(aDict)
    aDict.each do |bucket|
      if bucket
        puts bucket
      end
    end
  end

end