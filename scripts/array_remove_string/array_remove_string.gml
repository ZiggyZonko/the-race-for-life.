function array_remove_string(_arr, _str) {
    var idx = -1;

    // find the string in the array
    for (var i = 0; i < array_length(_arr); i++) {
        if (_arr[i] == _str) {
            idx = i;
            break;
        }
    }

    // if found, remove it
    if (idx != -1) {
        for (var i = idx; i < array_length(_arr) - 1; i++) {
            _arr[i] = _arr[i + 1];
        }
        array_resize(_arr, array_length(_arr) - 1);
    }

    return _arr;
}