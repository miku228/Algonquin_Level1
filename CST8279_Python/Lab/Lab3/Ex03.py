# make the input int type
birth_year = int(input("Enter your birth year : "))
limit_2022 = 6000  # 2019 ~ 2022 4years
limit_2018 = 5500  # 2016 ~ 2018 3years
limit_2015 = 10000  # 2015 1year
limit_2014 = 5500  # 2013 ~ 2014 2years
limit_2012 = 5000  # 2009 ~ 2012 4years

# age = 2022 - birth_year
# calculate the year user turn into 18 years old
start_year = birth_year + 18
# print("your age :", age)
# print("contribution start year :", start_year)

# check the year that user turn into 18 years old
if 2022 < start_year:
    print("Your TFSA Contribution Room has not started yet")
# user turn into 18 years old between 2019~2022
elif 2019 <= start_year <= 2022:
    tfsa_years_1 = 2022 - start_year + 1
    # user have one terms (2019~2022)
    contribution_limit = tfsa_years_1 * limit_2022

# user turn into 18 years old between 2016~2018
elif 2016 <= start_year <= 2018:
    # years after turn into 18 between 2016~2018
    tfsa_years_2 = 2018 - start_year + 1
    # user have two terms (2019~2022, 2016~2018)
    contribution_limit = 4 * limit_2022 + tfsa_years_2 * limit_2018

# user turn into 18 years old in 2015
elif 2015 == start_year:
    # years after turn into 18 between 2016~2018
    tfsa_years_3 = 2015 - start_year + 1
    # user have three terms (2019~2022, 2016~2018, 2015)
    contribution_limit = 4 * limit_2022 + 3 * limit_2018 + tfsa_years_3 * limit_2015

# user turn into 18 years old between 2013~2014
elif 2013 <= start_year <= 2014:
    # years after turn into 18 between 2013~2014
    tfsa_years_4 = 2014 - start_year + 1
    # user have four terms (2019~2022, 2016~2018, 2015, 2013~2014)
    contribution_limit = 4 * limit_2022 + 3 * limit_2018 + 1 * limit_2015 + tfsa_years_4 * limit_2014

# user turn into 18 years old between 2009~2012
elif 2009 <= start_year <= 2012:
    # years after turn into 18 between 2009~2012
    tfsa_years_5 = 2012 - start_year + 1
    # user have all five terms (2019~2022, 2016~2018, 2015, 2013~2014, 2009~2012)
    contribution_limit = 4 * limit_2022 + 3 * limit_2018 + 1 * limit_2015 + 2 * limit_2014 + tfsa_years_5 * limit_2012

else:
    # user have five terms fully (2019~2022, 2016~2018, 2015, 2013~2014, 2009~2012)
    contribution_limit = 4 * limit_2022 + 3 * limit_2018 + 1 * limit_2015 + 2 * limit_2014 + 4 * limit_2012

print("Your Contribution limit is : $", contribution_limit)


