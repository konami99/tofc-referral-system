# Referral System

## Setup
```
bundle
rails db:seed
rails s
```

## Terminology


## Rewards System

Rewards System is triggered after user is created. Referrer's `referrals_count` will be incremented by 1.

There're three types of awards: bronze, silver and gold.

```
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
