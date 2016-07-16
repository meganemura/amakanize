require "active_support"

module Amakanize
  module Filters
    class NormalizationFilter < BaseFilter
      ENCLOSED_ALPHANUMERICS_COLLECTION = %w(
        ⓿
        ⓪
        ➀
        ➊
        ➀
        ❶
        ①
        ⓵
        ⓾
        ➉
        ❿
        ➉
        ➓
        ⑩
        ⓫
        ⑪
        ⓬
        ⑫
        ⑬
        ⓭
        ⑭
        ⓮
        ⑮
        ⓯
        ⑯
        ⓰
        ⓱
        ⑰
        ⓲
        ⑱
        ⑲
        ⓳
        ❷
        ⓶
        ②
        ➁
        ➋
        ➁
        ⓴
        ⑳
        ㉑
        ㉒
        ㉓
        ㉔
        ㉕
        ㉖
        ㉗
        ㉘
        ㉙
        ➌
        ➂
        ⓷
        ❸
        ③
        ➂
        ㉚
        ㉛
        ㉜
        ㉝
        ㉞
        ㉟
        ㊱
        ㊲
        ㊳
        ㊴
        ➃
        ➍
        ⓸
        ④
        ❹
        ➃
        ㊵
        ㊶
        ㊷
        ㊸
        ㊹
        ㊺
        ㊻
        ㊼
        ㊽
        ㊾
        ⑤
        ⓹
        ➄
        ➄
        ❺
        ➎
        ㊿
        ⑥
        ➅
        ❻
        ➏
        ⓺
        ➅
        ➆
        ⑦
        ➐
        ⓻
        ➆
        ❼
        ⑧
        ➇
        ➇
        ❽
        ⓼
        ➑
        ❾
        ⑨
        ➈
        ⓽
        ➒
        ➈
        ⓐ
        Ⓐ
        ⓑ
        Ⓑ
        ⓒ
        Ⓒ
        ⓓ
        Ⓓ
        ⓔ
        Ⓔ
        ⓕ
        Ⓕ
        ⓖ
        Ⓖ
        ⓗ
        Ⓗ
        ⓘ
        Ⓘ
        ⓙ
        Ⓙ
        ⓚ
        Ⓚ
        ⓛ
        Ⓛ
        ⓜ
        Ⓜ
        ⓝ
        Ⓝ
        ⓞ
        Ⓞ
        ⓟ
        Ⓟ
        ⓠ
        Ⓠ
        ⓡ
        Ⓡ
        ⓢ
        Ⓢ
        ⓣ
        Ⓣ
        ⓤ
        Ⓤ
        ⓥ
        Ⓥ
        ⓦ
        Ⓦ
        ⓧ
        Ⓧ
        ⓨ
        Ⓨ
        ⓩ
        Ⓩ
      )

      # @note Override
      def call(string)
        ENCLOSED_ALPHANUMERICS_COLLECTION.inject(string) do |result, enclosed_alphanumerics|
          result.gsub(enclosed_alphanumerics) do |matched_string|
            ::ActiveSupport::Multibyte::Unicode.normalize(matched_string)
          end
        end
      end
    end
  end
end