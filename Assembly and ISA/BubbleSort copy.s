#####################################################
############# Initializing the array ################
#####################################################
# s0 = len(arr) - 1
li s0, 9
# s1 = array base address
li s1, 0
# arr = [8, 2, 4, 9, 3, 1, 6, 5, 0, 7]
li t0, 8
sw t0, 0(s1)
li t0, 2
sw t0, 4(s1)
li t0, 4
sw t0, 8(s1)
li t0, 9
sw t0, 12(s1)
li t0, 3
sw t0, 16(s1)
li t0, 1
sw t0, 20(s1)
li t0, 6
sw t0, 24(s1)
li t0, 5
sw t0, 28(s1)
li t0, 0
sw t0, 32(s1)
li t0, 7
sw t0, 36(s1)
#####################################################
################### Bubble Sort #####################
#####################################################
# s2 = i = 0
li s2, 0
loop_i:
    # i == len(arr)-1 then end the program
    beq s2, s0, end
    # s3 = j = 0
    li s3, 0
    loop_j:
        # j == len(arr)-1-i then continue to next i
        sub t0, s0, s2
        beq s3, t0, next_i
        # t0 = &arr[j], t1 = &arr[j+1]
        slli t0, s3, 2
        add t0, t0, s1
        li t1, 8
        add t1, t1, t0
        # t2 = arr[j], t3 = arr[j+1]
        lw t2, 0(t0)
        lw t3, 0(t1)
        # arr[j] <= arr[j+1] then continue to next j
        ble t2, t3, next_j
        # swap arr[j] and arr[j+1]
        sw t3, 0(t0)
        sw t2, 0(t1)
    next_j:
        # j += 1
        addi s3, s3, 1
        j loop_j
next_i:
    # i += 1
    addi s2, s2, 1
    j loop_i
end: