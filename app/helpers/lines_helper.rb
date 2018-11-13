module LinesHelper
  def fact_mark(l)
    fact = 0
    if (l.recruitment and l.studying)
      fact += (l.recruitment * (1/3.0) + l.studying - l.release * (2/3.0))
      if (r=l.reasons)
        for r1 in r
          if (s=r1.sourses)
            c1 = s.pluck(:kind1, :value)
            for c in c1
              if c[0] == "Прием"
                fact += c[1] * (1/3.0)
              elsif c[0] == "Обучается"
                fact += c[1]
              elsif c[0] == "Выпуск"
                fact += c[1] * (2/3.0)
              end
            end
          end
        end
        # c = r.pluck(:kind, :value)
        # for v in c
        #    if v[0] == "+"
        #      fact += v[1] * (2/3.0)
        #    elsif v[0] == "-"
        #      fact -= v[1] * (2/3.0)
        #    end
        # end
      end
    end
    return ((fact* 100).round / 100.0)
  end
  def otkl_mark(line)
    return ((((fact_mark(line) / line.mark) * 100 - 100) * 100).round / 100.0)
  end

  def my_true(verification)
    if verification
      return "Да"
    else
      return "Нет"
    end
  end

  def my_otkl(filial,task)
    count = 0
    a= task.sections.each do |e|
      e.lines. each do |l|
        if (l.filial_id == filial.id)
          then count += otkl_mark(l)
        end
      end
    end
    return count
  end
end
