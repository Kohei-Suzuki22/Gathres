require 'rails_helper'

RSpec.describe User, type: :model do

  let(:user){User.new(name:"user", email: "user@example.com", password_digest:"password")}

  describe "check valid user" do

    it "should be valid" do
      expect(user).to be_valid
    end

    describe "validates name" do
      it "should be invalid" do
        user.name = ""
        expect(user).to be_invalid
      end
      it "should be invalid" do
        user.name = " "
        expect(user).to be_invalid
      end
      it "should be too long" do
        user.name = "a" * 51
        expect(user).to be_invalid
      end
      it "should be valid" do
        user.name = "a" * 50
        expect(user).to be_valid
      end
    end

    describe "validates email" do

      it "should be invalid" do
        user.email = ""
        expect(user).to be_invalid
      end

      it "should be invalid" do
        user.email = " "
        expect(user).to be_invalid
      end

      it "should be too long" do
        user.email = "a" * 244 + "@example.com"
        expect(user).to be_invalid
      end

      it "should be valid" do
        user.email = "a" * 243 + "@example.com"
        expect(user).to be_valid
      end

      it "the format should be valid" do
        valid_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
                           first.last@foo.jp alice+bob@baz.cn)
        valid_addresses.each do |valid_address|
          user.email = valid_address
          expect(user).to be_valid, "#{valid_address.inspect} should be valid"
        end
      end

      it "the format should be invalid" do
        invalid_addresses = %w(user@example,com user_at_foo.org user.name@example.
                               foo@bar_baz.com foo@bar+baz.com)
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).to be_invalid, "#{invalid_address.inspect} should be invalid"
        end
      end

      it "email address should be unique" do
        duplicate_user = user.dup
        duplicate_user.email = user.email.upcase
        user.save
        expect(duplicate_user).to be_invalid
      end

      it "email address should be saved as lower-case" do
        mixed_case_email = "Foo@ExaMPle.Com"
        user.email = mixed_case_email
        user.save
        assert_equal mixed_case_email.downcase, user.reload.email
      end


    end



  end

end
