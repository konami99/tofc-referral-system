# Referral System

If you have trouble running this on local, please email richardchou89 (at) hotmail.com.

## Setup
```ruby
bundle
rails db:migrate RAILS_ENV=development
rails db:seed
rails s
```

## Terminology

![Screenshot 2025-04-16 at 08 05 21](https://github.com/user-attachments/assets/d34e742c-d59a-48c3-a7e3-76d98014168f)


## Rewards System

Rewards System is triggered after user is created. Referrer's `referrals_count` field will be incremented by 1.

There're three types of awards: bronze, silver and gold.

```ruby
class User < ApplicationRecord
  after_create :award

  private

  def award
    return unless referrer

    referrer.referrals_count += 1

    referrer_referrals_count = referrer.referrals_count


    if referrer_referrals_count > 0 && referrer_referrals_count < 3
      referrer.status = "bronze"
    elsif referrer_referrals_count >= 3 && referrer_referrals_count < 5
      referrer.status = "silver"
    elsif referrer_referrals_count >= 5
      referrer.status = "gold"
    end

    referrer.save
  end
end
```

## Tests

```ruby
rspec
```

Tests have been written for `User` model and `UsersController`.

<img width="799" alt="Screenshot 2025-04-16 at 08 00 05" src="https://github.com/user-attachments/assets/b6460310-2c96-42fc-8ce5-0b098c4558c4" />


## Basic Interface
An users index page showing users, their referrals' names, and referrals count.

You will only see data when database is seeded: `rails db:seed`.

![Screenshot 2025-04-16 at 07 52 55](https://github.com/user-attachments/assets/c2ee96d6-0d6e-4853-aa59-1c973dc4268b)

A couple of optmisations have been done to avoid N + 1 queires:

1. Eager loading referrals
```
@users = User.includes([ :referrals ])
```
2. Use `referrals_count` to store number of referrals, rather than doing `select count(*) from users where referred_by_id = ?` for each user.



