(*
 * Copyright (c) 2010-2011 Anil Madhavapeddy <anil@recoil.org>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 *
 *)

module Make ( N:V1_LWT.NETWORK ) : sig
  include V1_LWT.ETHIF with type netif = N.t
  (** [input] processes all ethernet frames from [N] that are relevant to us
      (i.e are addressed to us or are broadcast). *)

  val connect : netif -> [> `Ok of t | `Error of error ] Lwt.t
end

module Raw ( N:V1_LWT.NETWORK ) : sig
  include V1_LWT.ETHIF with type netif = N.t
  (** [input] processes all ethernet frames from [N], even those addressed to
      other machines. *)

  val connect : netif -> [> `Ok of t | `Error of error ] Lwt.t
end
