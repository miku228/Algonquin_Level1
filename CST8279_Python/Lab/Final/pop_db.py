# functions calculate tax
# calculate federal tax rate 2022
def calc_fed_tax(gross_income):
    f_tax = 0
    ft_income1 = 50197
    ft_income2 = 50195
    ft_income3 = 55233
    ft_income4 = 66083
    f_tax_max1 = ft_income1 * 0.15
    f_tax_max2 = ft_income2 * 0.205
    f_tax_max3 = ft_income3 * 0.26
    f_tax_max4 = ft_income4 * 0.29

    # ($0 <= gross_income <= $50,197) 15% on the first $50,197 of taxable income, plus
    if gross_income - ft_income1 <= 0:
        # print('- gross_income is less than or equal $50,195 :', gross_income)
        f_tax = gross_income * 0.15

    # ($50,197 < gross_income <= $100,392) 20.5% on the next $50,195 of taxable income, plus
    elif gross_income - (ft_income1 + ft_income2) <= 0:
        # print('- gross_income is over $50,195 up to $100,392:', gross_income)
        f_tax = f_tax_max1 + (gross_income - ft_income1) * 0.205

    # ($100,392 < gross_income <= $155,625) 26% on the next $55,233 of taxable income, plus
    elif gross_income - (ft_income1 + ft_income2 + ft_income3) <= 0:
        f_tax = f_tax_max1 + f_tax_max2 + (gross_income - ft_income1 - ft_income2) * 0.26

    # ($155,625 < gross_income <= $221,708) 29% on the next $66,083 of taxable income, plus
    elif gross_income - (ft_income1 + ft_income2 + ft_income3 + ft_income4) <= 0:
        f_tax = f_tax_max1 + f_tax_max2 + f_tax_max3 + (gross_income - ft_income1 - ft_income2 - ft_income3) * 0.29

    # ($221,708 < gross_income) 33% of taxable income over $221,708
    else:
        f_tax = f_tax_max1 + f_tax_max2 + f_tax_max3 + f_tax_max4 + (gross_income - ft_income1 - ft_income2 - ft_income3 - ft_income4) * 0.33

    # round result to two decimal number
    return round(f_tax)


# print(calc_fed_tax(50198))

# calculate ontario tax rate 2022
def calc_on_tax(gross_income):
    o_tax = 0
    ot_income1 = 46226
    ot_income2 = 92454
    ot_income3 = 150000
    ot_income4 = 220000
    o_tax_max1 = ot_income1 * 0.0505
    o_tax_max2 = ot_income2 * 0.0915
    o_tax_max3 = ot_income3 * 0.1116
    o_tax_max4 = ot_income4 * 0.1216

    # ($0 <= gross_income <= $46,226) 5.05 % on the first $46,226 of taxable income, plus
    if gross_income <= ot_income1:
        # print('- gross_income is less than or equal $46,226 :', gross_income)
        o_tax = gross_income * 0.0505

    # ($46,226 < gross_income <= $92,454) 9.15 % on the next $92,454 plus
    elif ot_income1 < gross_income <= ot_income2:
        # print('- gross_income is more than $92,454 and less than or equal $138,680 :', gross_income)
        o_tax = o_tax_max1 + (gross_income - ot_income1) * 0.0915

    # ($92,454 < gross_income <= $150,000) 11.16 % on the next $150,000 plus
    elif ot_income2 < gross_income <= ot_income3:
        # print('- gross_income is less than $138,680 and less than or equal $288,680 :', gross_income)
        o_tax = o_tax_max1 + o_tax_max2 + (gross_income - ot_income1 - ot_income2) * 0.1116

    # ($150,000 < gross_income <= $220,000) 12.16 % on the next $ 220,000 plus
    elif ot_income3 < gross_income <= ot_income4:
        o_tax = o_tax_max1 + o_tax_max2 + o_tax_max3 + (gross_income - ot_income1 - ot_income2 - ot_income3) * 0.1216

    # ($220,000 < gross_income) 13.16 % on the amount over $220,000
    else:
        o_tax = o_tax_max1 + o_tax_max2 + o_tax_max3 + o_tax_max4 + (gross_income - ot_income1 - ot_income2 - ot_income3 - ot_income4) * 0.1316

    # round result to two decimal number
    return round(o_tax)


# print(calc_on_tax(288681))

# calculate Canada Pension Plan Contribution 2022
def calc_cpp(gross_income):
    # Max contributory earnings: $61,400 @ 5.7 %
    # If the income is less than $61,400 then CPP is 5.7 % of the annual gross income.
    # If the income is equal or greater than $61, 400 then CPP is 5.7 % $61,400.
    cpp_tax = 61400
    if gross_income < 61400:
        cpp_tax = gross_income * 0.057

    # round result
    return round(cpp_tax)


# calculate EI Premium Rate for 2022
def calc_ei(gross_income):
    # Max contributory earnings: $60, 300 @ 1.58 %
    # If the income is less than $60, 300 then EI is 1.58 % of the annual gross income.
    # If the income is equal or greater than $60, 300 then EI is 1.58 % $60, 300.
    ei_tax = 60300
    if gross_income < 60300:
        ei_tax = gross_income * 0.0158

    # round result
    return round(ei_tax)


# print(calc_ei(60299))