defmodule ExamReview do
  def double(lst), do: double2(lst, [], 1)
  defp double2([], res, n), do: Enum.reverse(res)
  defp double2([head|tail],res,n), do: double2(tail, [head|head * n], n+1)

  def ends4(list), do: do_ends4(list,[])
  defp do_ends4([],res), do: Enum.reverse(res)
  defp do_ends4([head|tail],res), when rem(head,10)==4, do: do_ends4([ | tail], res) do: do_ends4(tail,res)
end
