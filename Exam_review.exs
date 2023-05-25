defmodule ExamReview do
  def double(lst), do: double2(lst, [], 1)
  defp double2([], res, n), do: Enum.reverse(res)
  defp double2([head|tail],res,n), do: double2(tail, [head|head * n], n+1)
end
