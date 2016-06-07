module QuickUpdateJournalHelper

  def next_approved_status(issue, user)

  end

  def next_approved_status(&allowed_status)
    allowed_status
  end

  def rejected_status(issue, user)

  end

  def rejected_status(&allowed_status)

  end

  def is_last_state?(issue, user)
    return false
  end

  def is_last_state?(&allowed_status)
    return false
  end

end