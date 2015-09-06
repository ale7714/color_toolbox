module ColorToolbox
class Gradient
  attr_reader :colors, :color_range_size, :gradient_count

  # color [ 255, 255, 255] or "#ffffff"
  def initialize(colors, color_range_size: 10)
    @color_range_size = color_range_size - 1
    @colors = colors.map{ |color| to_rgb(color) }
    @gradient_count = colors.length - 1
  end

  def to_rgb(color)
    return color if is_rgb?(color)
    [ color[1..2].hex, color[3..4].hex, color[5..6].hex ]
    rescue => e
      raise "#{color} is not a valid RGB/HEX color. Error: #{e}"
  end

  def to_hex(color)
    return color if is_hex?(color)
    "##{color.map { |component| component.to_i.to_s(16).rjust(2, '0') }.join('')}"
    rescue => e
      raise "#{color} is not a valid RGB/HEX color. Error: #{e}"
  end

  def gradient
    @gradient ||= begin
      subcolor_range_size = color_range_size / gradient_count
      residue = color_range_size % gradient_count
      gradient = []
      @gradient_count.times do | index|
        color_range_size = subcolor_range_size
        if residue > 0
          color_range_size += 1
          residue -= 1
        end
        gradient += between(colors[index], colors[index+1], subcolor_range_size)
      end
      gradient << colors.last
    end
    @gradient
  end

  def hex
    gradient.map{ |color| to_hex(color) }
  end

  def rgb
    gradient.map { |color| color.map(&:to_i) }
  end

  private

  def between(color1, color2, color_range_size)
    color_range_size.times.inject([]) do |gradient, index|
      ratio = index.to_f / color_range_size
      r = color2[0] * ratio + color1[0] * (1 - ratio)
      g = color2[1] * ratio + color1[1] * (1 - ratio)
      b = color2[2] * ratio + color1[2] * (1 - ratio)
      gradient.push [ r, g, b ]
      gradient
    end
  end

  def is_rgb?(color)
    color.is_a?(Array) && color.length==3 &&
      color.all?{ |component| !!(component.to_i.to_s=~/^([01]?[0-9]?[0-9]|2[0-4][0-9]|25[0-5])$/) }
  end

  def is_hex?(color)
    color.is_a?(String) && !!(color=~/^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/)
  end
end
end