class Tag < BaseModel
  FUNNY_TAG_NAME = "Chargoggagoggmanchauggagoggchaubunagungamaugg"
  skip_default_columns

  table do
    primary_key custom_id : Int64
    timestamps
    column name : String
    has_many taggings : Tagging
  end
end
