OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
x q[4];
cx q[4], q[7];
cx q[8], q[1];
cx q[7], q[8];
cx q[5], q[4];
