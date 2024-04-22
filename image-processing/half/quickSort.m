function sortedArray = quickSort(array)
    if length(array) <= 1
        sortedArray = array;
        return;
    end
    pivot = array(ceil(length(array)/2));
    left = array(array < pivot);
    right = array(array > pivot);
    sortedArray = [quickSort(left) pivot quickSort(right)];
end