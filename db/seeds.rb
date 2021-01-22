#User.create(name: 'Admin1', first_name: 'Admin', birthday: "1990-01-01", profession: "Boss", telephone: 0000000, added_since: "2020-01-01", email: 'admin1@example.com', group_id: 1, admin: 1, setting_id: 1, promotion_id: 1, password: '123456', password_confirmation: '123456')
Group.create(name: 'Group1', description: 'Le groupe 1');
Setting.create(amount_due: 30000, devise: 'FCFA');
Promotion.create(name: "Promo 1", description: "La promo1", year_promotion: "2018-05-25")