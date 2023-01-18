OPENQASM 2.0;
include "qelib1.inc";
qreg q[8];
cx q[5], q[1];
x q[0];
cx q[6], q[2];
