OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[4];
cx q[1], q[4];
cx q[2], q[0];
cx q[5], q[6];
